# Generated by Django 3.1.dev20191210123428 on 2020-01-09 02:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aclapp', '0005_auto_20200109_1018'),
    ]

    operations = [
        migrations.RenameField(
            model_name='accesscontrol',
            old_name='user_id',
            new_name='uid',
        ),
        migrations.AddField(
            model_name='accesscontrol',
            name='uname',
            field=models.CharField(default=None, max_length=200),
        ),
    ]