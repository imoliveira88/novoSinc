# Generated by Django 4.2.7 on 2024-02-07 19:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aplicacao', '0015_alter_envio_data_vencimento'),
    ]

    operations = [
        migrations.AlterField(
            model_name='envio',
            name='email',
            field=models.CharField(max_length=1000, verbose_name='E-mail'),
        ),
        migrations.AlterField(
            model_name='modelo',
            name='emails',
            field=models.CharField(max_length=400),
        ),
    ]
