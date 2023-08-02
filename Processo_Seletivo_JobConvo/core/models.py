from django.db import models
from django.contrib.auth.models import AbstractBaseUser
class Base(models.Model):
    data_criado = models.DateField('Data de criação', auto_now_add=True)
    data_modificado = models.DateField('Data de atualização', auto_now=True)
    class Meta:
        abstract = True



class Empresa(AbstractBaseUser, Base):
    nome_empresa = models.CharField('Nome', max_length=100)
    email_empresa = models.EmailField('Email', max_length=254, unique=True)
    senha_empresa = models.CharField('Senha', max_length=100)
    USERNAME_FIELD = 'email_empresa'
    PASSWORD_FIELD = 'senha_empresa'
    def __str__(self):
        return self.nome_empresa

class candidato(AbstractBaseUser, Base):
    opcoes_escolaridade = [
        ('ensino_medio', 'Ensino médio'),
        ('tecnologo', 'Tecnólogo'),
        ('ensino_superior', 'Ensino Superior'),
        ('pos_mba_mestrado', 'Pós / MBA / Mestrado'),
        ('doutorado', 'Doutorado'),
    ]
    opcoes_salario = [
        ('até_1000', 'Até 1.000'),
        ('1000_a_2000', 'De 1.000 a 2.000'),
        ('2000_a_3000', 'De 2.000 a 3.000'),
        ('acima_de_3000', 'Acima de 3.000'),
    ]
    nome_candidato = models.CharField('Nome', max_length=100)
    pretensao_salarial = models.CharField(max_length=14,choices=opcoes_salario)
    escolaridade = models.CharField(max_length=17, choices=opcoes_escolaridade)
    experiencia_candidato = models.CharField('Experiencia', max_length=10000)
    email_candidato = models.EmailField('Email', max_length=254, unique=True)
    senha_candidato = models.CharField('Senha', max_length=100)
    USERNAME_FIELD = 'email_candidato'
    PASSWORD_FIELD = 'senha_candidato'

    def __str__(self):
        return self.nome_candidato

class vaga(Base):
    opcoes_salario = [
        ('até_1000', 'Até 1.000'),
        ('1000_a_2000', 'De 1.000 a 2.000'),
        ('2000_a_3000', 'De 2.000 a 3.000'),
        ('acima_de_3000', 'Acima de 3.000'),
    ]
    opcoes_escolaridade = [
        ('ensino_medio', 'Ensino médio'),
        ('tecnologo', 'Tecnólogo'),
        ('ensino_superior', 'Ensino Superior'),
        ('pos_mba_mestrado', 'Pós / MBA / Mestrado'),
        ('doutorado', 'Doutorado'),
    ]
    empresa = models.ForeignKey(Empresa, on_delete=models.CASCADE)
    nome_vaga = models.CharField('Nome', max_length=200)
    faixa_salarial = models.CharField(max_length=14,choices=opcoes_salario)
    requisitos = models.CharField('Requisitos', max_length=10000)
    escolaridade = models.CharField(max_length=17, choices=opcoes_escolaridade)

    def __str__(self):
        return self.nome_vaga

class vaga_candidato(Base):
    vaga = models.ForeignKey(vaga, on_delete=models.CASCADE)
    candidato = models.ForeignKey(candidato, on_delete=models.CASCADE)
    pontos = models.IntegerField()
    class Meta:
        unique_together = ('vaga', 'candidato')

