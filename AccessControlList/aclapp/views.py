from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader, RequestContext
from .models import UserDetail, AccessControl

from django_auth_ldap.backend import LDAPBackend
from django.contrib.auth.models import User
from django.contrib.sessions.models import Session
from django.conf import settings

# Display list of users and their details
def index(request):
    #users = UserDetail.objects.all()
    #lists = AccessControl.objects.all()
    users = UserDetail.objects.raw('SELECT u.id, u.user_id, u.name, u.roles, u.status, u.email, u.section, a.permissions FROM `aclapp_accesscontrol` a JOIN `aclapp_userdetail` u WHERE a.uid_uname = u.user_id')

    context = {
        'users': users,
        #'lists': lists,
    }

    return render(request, 'index.html', context)


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
                
        UserDetail.objects.filter(pk=id, user_id=user_id).update(name=name, user_id=user_id, email=email, section=section, status=status, roles=roles)
        AccessControl.objects.filter(uid_uname=user_id).update(permissions=permissions)

        return redirect('/')
    else:
        return render(request, 'index.html')

def login_page(request):
    return render(request, 'login.html')

def login_user(request):
    if (request.method == 'POST'):
        username = request.POST['username']
        password = request.POST['password']

        auth = LDAPBackend()
        user = auth.authenticate(request, username=username, password=password)

        # Check if user can be authenticated in LDAP server
        if user is not None:
            print(username + " has successfully authenticated on LDAP server")

            # Get user objects from auth_user table
            usr = User.objects.get(username=username)

            # Check if user already exist in UserDetail model
            # Create user if user does not exist previously
            if UserDetail.objects.filter(user_id=username).count() > 0:
                
                # Start user session
                request.session['username'] = username
                #request.user = username 
                if User.is_active == True:
                    print("user is authenticated " + usr.username + usr.first_name + usr.email)

                print("Current session username: " + request.session['username'])

                # Redirect successfully authenticated LDAP user to the ACL home page
                # TODO: Redirect user to the ACL home page
                #return HttpResponse("User authenticated, " + username + " already exist")

                return index(request)
                
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

                # Start user session
                request.session['username'] = username
                #request.user.username() = username
                print("Current session username:" + request.session['username'])

                # TODO: Redirect user to the ACL home page

                return HttpResponse("User authenticated, created new user " + username)
                #render(request, 'index.html', context)
                
        else:
            # Failed to login user using LDAP authentication
            # TODO: Redirect user back to the login page and show error message
            print('User failed to authenticate')
            return HttpResponse("User authentication failed")

def logout_user(request):
    try:
        del request.session['username']
    except KeyError:
        pass
    return render(request, 'logout.html')
