from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from .models import UserDetail, AccessControl

from django_auth_ldap.backend import LDAPBackend
from django.contrib.auth.models import User
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

    #state = ""

    username = settings.AUTH_LDAP_BIND_DN
    password = settings.AUTH_LDAP_BIND_PASSWORD

    if (request.method == 'POST'):
        username = request.POST['username']
        password = request.POST['password']

        print(username)

        auth = LDAPBackend()
        user = auth.authenticate(request, username=username, password=password)

        if user is not None:
            print('user is authenticated')
            return HttpResponse("User authenticated")
        else:
            print('User failed to authenticate')
            return HttpResponse("User authentication failed")

    """
    try:
        User = auth.authenticate(username=username,password=password) 
        if User is not None:
            state = "Valid"

        else:
            state = "Invalid"

    except:
            state = "Error"

    return HttpResponse(state)  
    """