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
    project_mgmt = models.TextField(default=None, null=True)
    engagement_mgmt = models.TextField(default=None, null=True)
    issue_mgmt = models.TextField(default=None, null=True)
    user_mgmt = models.TextField(default=None, null=True)
    reporting_mgmt = models.TextField(default=None, null=True)
    setting = models.TextField(default=None, null=True)
    audit_log  = models.TextField(default=None, null=True)

    """
    PROJECT_MANAGEMENT = (
            ('Listing', 'Listing'),
            ('Create', 'Create'),
            ('Edit', 'Edit'),
            ('Delete', 'Delete'),
    )

    ENGAGEMENT_MANAGEMENT = (
        ('All Listing', 'All Listing'),
        ('Listing', 'Listing'),
        ('Create', 'Create'),
        ('Edit', 'Edit'),
        ('Delete', 'Delete'),
    )

    ISSUE_MANAGEMENT = (
        ('Listing', 'Listing'),
        ('Create', 'Create'),
        ('Edit Detail', 'Edit Detail'),
        ('Edit Reply', 'Edit Reply'),
        ('Edit Discussion', 'Edit Discussion'),
        ('Delete', 'Delete'),
        ('By Pass', 'By Pass'),
    )

    USER_MANAGEMENT = (
        ('Listing', 'Listing'),
        ('Edit', 'Edit'),
        ('Delete', 'Delete'),
    )

    REPORTING_MANAGEMENT = (
        ('Listing', 'Listing'),
    )

    SETTING = (
        ('Listing', 'Listing'),
        ('Create', 'Create'),
        ('Edit', 'Edit'),
        ('Delete', 'Delete'),
    )
 
    AUDIT_LOG = (
        ('View Log', 'View Log'),
    )
    
    project_mgmt = MultiSelectField(choices = PROJECT_MANAGEMENT, null=True)
    engagement_mgmt = MultiSelectField(choices = ENGAGEMENT_MANAGEMENT, null=True)
    issue_mgmt = MultiSelectField(choices = ISSUE_MANAGEMENT, null=True)
    user_mgmt = MultiSelectField(choices = USER_MANAGEMENT, null=True)
    reporting_mgmt = MultiSelectField(choices = REPORTING_MANAGEMENT, null=True)
    setting = MultiSelectField(choices = SETTING, null=True)
    audit_log = MultiSelectField(choices = AUDIT_LOG, null=True)
    """
