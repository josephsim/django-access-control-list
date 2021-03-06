# Generated by Django 3.1.dev20191210123428 on 2020-01-09 02:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='UserDetail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default=None, max_length=200)),
                ('user_id', models.CharField(default=None, max_length=200)),
                ('roles', models.CharField(default=None, max_length=100)),
                ('status', models.BooleanField(default=False)),
                ('email', models.CharField(default=None, max_length=200)),
                ('section', models.CharField(default=None, max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='AccessControl',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('permissions', models.TextField(default=None, null=True)),
                ('uid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='aclapp.UserDetail')),
            ],
        ),
    ]
