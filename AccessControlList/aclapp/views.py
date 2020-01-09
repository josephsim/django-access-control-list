from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from .models import UserDetail, AccessControl

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