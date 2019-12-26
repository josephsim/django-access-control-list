from django.shortcuts import render
from django.http import HttpResponse
from .models import Acl

# Create your views here.

def index(request):
    lists = Acl.objects.all()[:10]
    context = {
        'lists':lists
    }
    return render(request, 'index.html', context)

def details(request, list_id):
    acl = Acl.objects.get(id=list_id)

    context = {
        'lists': acl
    }
    return render(request, 'details.html', context)