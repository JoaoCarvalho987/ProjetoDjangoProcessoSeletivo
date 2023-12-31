# Generated by Django 4.2.3 on 2023-07-29 15:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_remove_candidato_data_ativo_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='vaga',
            name='escolaridade',
            field=models.CharField(choices=[('ensino_medio', 'Ensino médio'), ('tecnologo', 'Tecnólogo'), ('ensino_superior', 'Ensino Superior'), ('pos_mba_mestrado', 'Pós / MBA / Mestrado'), ('doutorado', 'Doutorado')], max_length=17),
        ),
        migrations.AlterField(
            model_name='vaga',
            name='faixa_salarial',
            field=models.CharField(choices=[('até_1000', 'Até 1.000'), ('1000_a_2000', 'De 1.000 a 2.000'), ('2000_a_3000', 'De 2.000 a 3.000'), ('acima_de_3000', 'Acima de 3.000')], max_length=14),
        ),
    ]
