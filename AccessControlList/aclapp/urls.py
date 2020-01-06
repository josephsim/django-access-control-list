from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('aclapp/', views.index, name='index'),
]