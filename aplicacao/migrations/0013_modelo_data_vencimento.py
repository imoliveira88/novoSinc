# Generated by Django 4.2.7 on 2024-02-06 14:37

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('aplicacao', '0012_modelo_emails'),
    ]

    operations = [
        migrations.AddField(
            model_name='modelo',
            name='data_vencimento',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='Data_Vencimento'),
            preserve_default=False,
        ),
    ]
