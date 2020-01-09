# Generated by Django 3.1.dev20191210123428 on 2020-01-09 08:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aclapp', '0008_auto_20200109_1039'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='accesscontrol',
            name='audit_log',
        ),
        migrations.RemoveField(
            model_name='accesscontrol',
            name='engagement_mgmt',
        ),
        migrations.RemoveField(
            model_name='accesscontrol',
            name='issue_mgmt',
        ),
        migrations.RemoveField(
            model_name='accesscontrol',
            name='project_mgmt',
        ),
        migrations.RemoveField(
            model_name='accesscontrol',
            name='reporting_mgmt',
        ),
        migrations.RemoveField(
            model_name='accesscontrol',
            name='setting',
        ),
        migrations.RemoveField(
            model_name='accesscontrol',
            name='user_mgmt',
        ),
        migrations.AddField(
            model_name='accesscontrol',
            name='permissions',
            field=models.TextField(default=None, null=True),
        ),
    ]
