# Generated by Django 4.2.7 on 2024-02-06 14:42

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('aplicacao', '0013_modelo_data_vencimento'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='modelo',
            name='data_vencimento',
        ),
        migrations.AddField(
            model_name='envio',
            name='data_vencimento',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='Data_Vencimento'),
            preserve_default=False,
        ),
    ]
