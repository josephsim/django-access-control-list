from django.shortcuts import render
from django.http import HttpResponse
from .models import UserDetail, AccessControl

def index(request):
    users = UserDetail.objects.all()
    context = {
        'users':users
    }
    return render(request, 'index.html', context)