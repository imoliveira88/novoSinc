# Generated by Django 4.2.7 on 2024-03-05 12:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aplicacao', '0017_alter_envio_contrato_alter_envio_email'),
    ]

    operations = [
        migrations.AddField(
            model_name='envio',
            name='cliente',
            field=models.CharField(max_length=100, null=True, verbose_name='Cliente'),
        ),
    ]
