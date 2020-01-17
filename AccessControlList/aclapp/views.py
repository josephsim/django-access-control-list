from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.template import loader
from .models import UserDetail, AccessControl
from django.contrib.auth.decorators import login_required

# imports required for LDAP
from django_auth_ldap.backend import LDAPBackend
from django.contrib.auth.models import User
from django.conf import settings
from django.contrib.sessions.models import Session
import ldap 

# imports for forms
from django.contrib.auth import (
    authenticate,
    get_user_model,
    login,
    logout,
)
from .forms import UserLoginForm

# Display list of users and their details
@login_required
def aclapp(request):
    #users = UserDetail.objects.all()
    #lists = AccessControl.objects.all()
    users = UserDetail.objects.raw('SELECT u.id, u.user_id, u.name, u.roles, u.status, u.email, u.section, a.permissions FROM `aclapp_accesscontrol` a JOIN `aclapp_userdetail` u WHERE a.uid_uname = u.user_id')

    context = {
        'users': users,
        #'lists': lists,
    }

    return render(request, 'aclapp.html', context)

# Submit an update for UserDetails and AccessControl
@login_required
def submit(request):
    if (request.method == 'POST'):

        # Variables for UserDetail model
        id = request.POST['id']
        name = request.POST['name']
        user_id = request.POST['user_id']
        email = request.POST['email']
        section = request.POST['section']
        status = request.POST['status']
        roles = request.POST['roles']

        # 'permissions' variable for AccessControl model
        permissions = request.POST.getlist('permissions[]')
        
        # Located the pre-existed user in the database and update the user's data with the 'POST' data 
        UserDetail.objects.filter(pk=id, user_id=user_id).update(name=name, user_id=user_id, email=email, section=section, status=status, roles=roles)
        AccessControl.objects.filter(uid_uname=user_id).update(permissions=permissions)

        return redirect('/aclapp')
    else:
        return render(request, '/aclapp')

def login_view(request):
    next = request.GET.get('next')
    form = UserLoginForm(request.POST or None)

    if form.is_valid():
        username = form.cleaned_data.get('username')
        password = form.cleaned_data.get('password')

        if (request.method == 'POST'):
            username = request.POST['username']
            password = request.POST['password']

            auth = LDAPBackend()
            ldapuser = auth.authenticate(request, username=username, password=password)

            # Check if user can be authenticated in LDAP server
            if ldapuser is not None:
                print(username + " has successfully authenticated on LDAP server")

                # Get user objects from auth_user table
                usr = User.objects.get(username=username)

                # Check if user already exist in UserDetail model
                # Create user if user does not exist previously
                if UserDetail.objects.filter(user_id=username).count() > 0:
                
                    if User.is_active == True:
                        print("user is authenticated " + usr.username + usr.first_name + usr.email)


                    # Redirect successfully authenticated LDAP user to the ACL home page
                    # TODO: Redirect user to the ACL home page
                    #return HttpResponse("User authenticated, " + username + " already exist")
                    
                else:

                    # Create new user for successfully authenticated LDAP user
                    # Set values for new user
                    name = usr.last_name
                    user_id = usr.username
                    email = usr.email
                    section = ""
                    status = usr.is_active
                    roles = "Normal User"

                    # Create new user to database
                    UserDetail.objects.create(name=name, user_id=user_id, email=email, section=section, status=status, roles=roles)
                    AccessControl.objects.create(uid_uname=user_id, permissions="")
            
            else:
                if next:
                    return redirect(next)
                return redirect('/')

        user = authenticate(username=username, password=password)
        login(request, user)
        if next:
            return redirect(next)
        return redirect('/')
    
    context = {
        'form': form,
    }
    return render(request, "login.html", context)

def logout_view(request):
    logout(request)
    return redirect('/')



# def login_page(request):
#     return render(request, 'login.html')

# def login_user(request):
#     if (request.method == 'POST'):
#         username = request.POST['username']
#         password = request.POST['password']

#         auth = LDAPBackend()
#         user = auth.authenticate(request, username=username, password=password)

#         # Check if user can be authenticated in LDAP server
#         if user is not None:
#             print(username + " has successfully authenticated on LDAP server")

#             # Get user objects from auth_user table
#             usr = User.objects.get(username=username)

#             # Check if user already exist in UserDetail model
#             # Create user if user does not exist previously
#             if UserDetail.objects.filter(user_id=username).count() > 0:
                
#                 # Start user session
#                 request.session['username'] = username
#                 #request.user = username 
#                 if User.is_active == True:
#                     print("user is authenticated " + usr.username + usr.first_name + usr.email)

#                 print("Current session username: " + request.session['username'])

#                 # Redirect successfully authenticated LDAP user to the ACL home page
#                 # TODO: Redirect user to the ACL home page
#                 #return HttpResponse("User authenticated, " + username + " already exist")

#                 return index(request)
                
#             else:

#                 # Create new user for successfully authenticated LDAP user
#                 # Set values for new user
#                 name = usr.last_name
#                 user_id = usr.username
#                 email = usr.email
#                 section = ""
#                 status = usr.is_active
#                 roles = "Normal User"

#                 # Create new user to database
#                 UserDetail.objects.create(name=name, user_id=user_id, email=email, section=section, status=status, roles=roles)
#                 AccessControl.objects.create(uid_uname=user_id, permissions="")

#                 # Start user session
#                 request.session['username'] = username
#                 #request.user.username() = username
#                 print("Current session username:" + request.session['username'])

#                 # TODO: Redirect user to the ACL home page

#                 return HttpResponse("User authenticated, created new user " + username)
#                 #render(request, 'index.html', context)
                
#         else:
#             # Failed to login user using LDAP authentication
#             # TODO: Redirect user back to the login page and show error message
#             print('User failed to authenticate')
#             return HttpResponse("User authentication failed")

# def logout_user(request):
#     try:
#         del request.session['username']
#     except KeyError:
#         pass
#     return render(request, 'logout.html')