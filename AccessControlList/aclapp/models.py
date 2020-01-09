from django.db import models
from multiselectfield import MultiSelectField

class UserDetail(models.Model):
    name = models.CharField(max_length=200, default=None)
    user_id = models.CharField(max_length=200, default=None)
    roles = models.CharField(max_length=100, default=None)
    status = models.BooleanField(default=False)
    email = models.CharField(max_length=200, default=None)
    section = models.CharField(max_length=200, default=None)
    def __str__(self):
        return self.name

class AccessControl(models.Model):
    uid_index = models.ForeignKey(UserDetail, on_delete=models.CASCADE)
    uid_uname = models.CharField(max_length=200, default=None)
    permissions = models.TextField(default=None, null=True)

    """
    project_mgmt = models.TextField(default=None, null=True)
    engagement_mgmt = models.TextField(default=None, null=True)
    issue_mgmt = models.TextField(default=None, null=True)
    user_mgmt = models.TextField(default=None, null=True)
    reporting_mgmt = models.TextField(default=None, null=True)
    setting = models.TextField(default=None, null=True)
    audit_log  = models.TextField(default=None, null=True)
    """