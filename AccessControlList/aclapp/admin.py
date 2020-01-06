from django.contrib import admin

from .models import AccessControl, UserDetail

admin.site.register(UserDetail)
admin.site.register(AccessControl)