from django.urls import path
from . import views

app_name = 'aclapp'
urlpatterns = [
    path('', views.aclapp, name='aclapp'),
    path('submit/', views.submit, name='submit'),

    # path('login/', views.login_page, name='login_page'),
    # path('login_user/', views.login_user, name='login_user'),

    # path('logout/', views.logout_user, name='logout_user'),
]