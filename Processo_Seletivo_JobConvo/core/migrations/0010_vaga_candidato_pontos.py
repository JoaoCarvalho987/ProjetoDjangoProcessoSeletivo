# Generated by Django 4.2.3 on 2023-08-01 02:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0009_alter_vaga_candidato_unique_together'),
    ]

    operations = [
        migrations.AddField(
            model_name='vaga_candidato',
            name='pontos',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
    ]
