# Generated by Django 3.1.dev20191210123428 on 2020-01-09 02:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('aclapp', '0004_auto_20200109_1016'),
    ]

    operations = [
        migrations.RenameField(
            model_name='accesscontrol',
            old_name='uid',
            new_name='user_id',
        ),
        migrations.RemoveField(
            model_name='accesscontrol',
            name='uname',
        ),
    ]
