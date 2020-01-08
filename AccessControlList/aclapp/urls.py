from django.urls import path
from . import views

app_name = 'aclapp'
urlpatterns = [
    path('', views.index, name='index'),
    path('aclapp/', views.index, name='index'),
    path('', views.submit, name='submit'),
]