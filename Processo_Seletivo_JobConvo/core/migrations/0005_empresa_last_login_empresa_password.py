# Generated by Django 4.2.3 on 2023-07-31 17:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_alter_candidato_email_candidato_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='empresa',
            name='last_login',
            field=models.DateTimeField(blank=True, null=True, verbose_name='last login'),
        ),
        migrations.AddField(
            model_name='empresa',
            name='password',
            field=models.CharField(default=1, max_length=128, verbose_name='password'),
            preserve_default=False,
        ),
    ]
