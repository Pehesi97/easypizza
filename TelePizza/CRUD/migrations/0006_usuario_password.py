# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-10 23:59
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CRUD', '0005_auto_20170407_2026'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuario',
            name='password',
            field=models.CharField(default=0, max_length=128),
            preserve_default=False,
        ),
    ]
