from django.urls import path
from . import views

app_name = 'aclapp'
urlpatterns = [
    path('', views.index, name='index'),
    path('aclapp/', views.index, name='index'),
    path('submit/', views.submit, name='submit'),
    path('login/', views.login_page, name='login_page'),
    path('login_user/', views.login_user, name='login_user'),
]