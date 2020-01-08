from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from .models import UserDetail, AccessControl

# Display list of users and their details
def index(request):
    users = UserDetail.objects.all()
    lists = AccessControl.objects.all()

    context = {
        'users': users,
        'lists': lists,
    }

    return render(request, 'index.html', context)


def submit(request):
    if request.method == 'POST':
        print(request.POST['id'],request.POST['name'])
        
        id = request.POST['id']
        name = request.POST['name']
        user_id = request.POST['user_id']
        roles = request.POST['roles']
        status = request.POST['status']
        email = request.POST['email']
        section = request.POST['section']
        
        user = models.UserDetail(id=id, name=name, user_id=user_id, roles=roles, status=status, email=email, section=section)
        user.save()
        return render(request,'index.html')
    else:
        print('else fail')
        return render(request,'index.html')
