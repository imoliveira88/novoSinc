# Generated by Django 4.2.7 on 2023-12-20 17:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aplicacao', '0002_alter_usuario_options_remove_usuario_login_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Envio',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('contrato', models.CharField(max_length=10, verbose_name='Contrato')),
                ('email', models.CharField(max_length=50, verbose_name='E-mail')),
                ('titulo', models.CharField(max_length=20, verbose_name='Titulo')),
                ('data_envio', models.DateTimeField(verbose_name='Data')),
                ('status_envio', models.BooleanField(verbose_name='Status')),
            ],
            options={
                'verbose_name': 'Envio',
                'verbose_name_plural': 'Envios',
                'ordering': ['contrato'],
            },
        ),
    ]
