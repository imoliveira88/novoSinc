# Generated by Django 4.2.7 on 2024-02-06 14:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aplicacao', '0014_remove_modelo_data_vencimento_envio_data_vencimento'),
    ]

    operations = [
        migrations.AlterField(
            model_name='envio',
            name='data_vencimento',
            field=models.CharField(max_length=20, verbose_name='Data_Vencimento'),
        ),
    ]
