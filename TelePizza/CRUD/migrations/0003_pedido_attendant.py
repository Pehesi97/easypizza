# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-02 03:38
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('CRUD', '0002_auto_20170402_0029'),
    ]

    operations = [
        migrations.AddField(
            model_name='pedido',
            name='attendant',
            field=models.ForeignKey(default=-1, on_delete=django.db.models.deletion.CASCADE, to='CRUD.Atendente'),
            preserve_default=False,
        ),
    ]
