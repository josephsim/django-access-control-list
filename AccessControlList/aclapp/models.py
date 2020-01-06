from django.db import models

class UserDetail(models.Model):
    name = models.CharField(max_length=200, default=None)
    userid = models.CharField(max_length=200, default=None)
    roles = models.CharField(max_length=100, default=None)
    status = models.BooleanField(default=0)
    email = models.CharField(max_length=200, default=None)
    section = models.CharField(max_length=200, default=None)
    def __str__(self):
        return self.name

class AccessControl(models.Model):
    userid = models.ForeignKey(UserDetail, on_delete=models.CASCADE)
    permissions = models.TextField(default=None, null=True)
    def __str__(self):
        return self.userid