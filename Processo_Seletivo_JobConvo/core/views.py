from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.decorators import login_required
from django.db.utils import IntegrityError
from django.db.models import Count  
from django.db.models.functions import Extract
import json
from .models import vaga, Empresa, vaga_candidato, candidato
from .forms import VagaModelForm, candidatoModelForm, CandidatoLoginForm, EmpresaLoginForm, VagaExclusaoForm

def index(request):
    return render(request, 'index.html')

def fazer_logout(request):
    logout(request)
    return redirect('index')

def login_candidato(request):
    print(request.user)
    if request.method == 'POST':
        form_candidato = CandidatoLoginForm(request.POST)
        if form_candidato.is_valid():
            email = form_candidato.cleaned_data['email']
            senha = form_candidato.cleaned_data['senha']
            
            candidato_atual = authenticate(request, email=email, password=senha)

            if candidato_atual is not None and candidato_atual.is_active:
                candidatos = candidato.objects.all()
                if candidato_atual in candidatos:
                    login(request, candidato_atual)
                    return redirect('dashboard_candidato')
                else:
                    form_candidato.add_error(None, 'Usuário não é um candidato.')
            else:
                form_candidato.add_error(None, 'Email ou senha incorretos.')
    else:
        form_candidato = CandidatoLoginForm()
    
    context = {
        'form': form_candidato
    }
    return render(request, 'candidatos/candidato_login.html', context)

def login_empresa(request):
    if request.method == 'POST':
        form_empresa = EmpresaLoginForm(request.POST)
        if form_empresa.is_valid():
            email = form_empresa.cleaned_data['email_empresa']
            senha = form_empresa.cleaned_data['senha_empresa']
            user = authenticate(request, email=email, password=senha)
            if user is not None:
                empresas = Empresa.objects.all()
                if user in empresas:
                    login(request, user)
                    return redirect('dashboard_empresa')
                else:
                    form_empresa.add_error(None, 'Usuário não é uma empresa.')
            else:
                form_empresa.add_error(None, 'Email ou senha incorretos.')
    else:
        form_empresa = EmpresaLoginForm()
    
    context = {
        'form': form_empresa
    }
    return render(request, 'empresas/empresa_login.html', context)


def novo_candidato(request):
    if request.method == 'POST':
        form = candidatoModelForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Candidato criado com sucesso!')
            form = candidatoModelForm()
        else:
            pass
    else:
        form = candidatoModelForm()
    context = {
            'form': form
        }
    return render(request, 'candidatos/novo_candidato.html', context)


@login_required(login_url="CandidatoLogin")
def criar_candidatura(request, vaga_id):
    candidatos = candidato.objects.all()
    if request.user.is_authenticated and request.user in candidatos:
        vagas = vaga.objects.get(id=vaga_id)

        if request.method == 'POST':
            try:
                opcoes_salario = {
                    'até_1000': 1,
                    '1000_a_2000': 2,
                    '2000_a_3000': 3,
                    'acima_de_3000': 4,
                }
                opcoes_escolaridade = {
                    'ensino_medio': 0,
                    'tecnologo': 1,
                    'ensino_superior': 2,
                    'pos_mba_mestrado': 3,
                    'doutorado': 4,
                }
                candidato_atual = request.user
                vaga_obj = vaga.objects.get(id=vaga_id)
                pontos_candidato = 0
                print(candidato_atual.pretensao_salarial)
                print(opcoes_salario['1000_a_2000'])

                if opcoes_escolaridade[candidato_atual.escolaridade] == opcoes_escolaridade[vaga_obj.escolaridade]:
                    pontos_candidato += 1

                if opcoes_salario[candidato_atual.pretensao_salarial] <= opcoes_salario[vaga_obj.faixa_salarial]:
                    pontos_candidato += 1

                vaga_candidatos = vaga_candidato(vaga=vagas, candidato=request.user, pontos=pontos_candidato)
                vaga_candidatos.save()
            except IntegrityError:
                messages.error(request, 'Você já se candidatou a esta vaga.')
            return redirect('dashboard_candidato')
        print(request.user.nome_candidato)
        context = {
            'vaga': vagas
        }
        return render(request, 'candidatos/dashboard.html', context)
    else:
        return redirect('CandidatoLogin')



@login_required(login_url="EmpresaLogin")
def nova_vaga(request):
    empresas = Empresa.objects.all()
    if request.user.is_authenticated and request.user in empresas:
        if request.method == 'POST':
            form = VagaModelForm(request.POST)
            if form.is_valid():
                form.instance.empresa_id = request.user.id
                form.save()
                messages.success(request, 'Vaga criada com sucesso!')
                form = VagaModelForm()
            else:
                messages.error(request, 'Sinto muito, ocorreu um erro ao criar a vaga! :(')
        else:
            form = VagaModelForm()
        context = {
            'form': form
        }
        return render(request, 'empresas/nova_vaga.html', context)
    else:
        return redirect('index')


@login_required(login_url="EmpresaLogin")
def editar_vaga(request, id):
    vaga_atual = vaga.objects.get(pk=id)
    empresas = Empresa.objects.all()
    if request.user.is_authenticated and request.user in empresas:
        if request.method == 'POST':
            form = VagaModelForm(request.POST, instance=vaga_atual)
            if form.is_valid():
                form.save()
                return redirect('dashboard_empresa')
        else:
            form = VagaModelForm(instance=vaga_atual)
        
        context = {
            'form': form,
        }
        return render(request, 'empresas/editar_vaga.html', context)
    else:
        return redirect('index')
    
@login_required(login_url="CandidatoLogin")
def excluir_candidatura(request, vaga_id):
    candidatos = candidato.objects.all()
    if request.user.is_authenticated and request.user in candidatos:
        try:
            vaga_candidatos = vaga_candidato.objects.get(candidato_id=request.user.id, vaga_id=vaga_id)
            vaga_candidatos.delete()
            return redirect('dashboard_candidato')
        except vaga_candidato.DoesNotExist:
            pass
    else:
        return redirect('index') 




@login_required(login_url="EmpresaLogin")
def excluir_vaga(request, vaga_id):
    empresas = Empresa.objects.all()
    if request.user.is_authenticated and request.user in empresas:
        vaga_atual = get_object_or_404(vaga, pk=vaga_id)

        if request.method == 'POST':
            form = VagaExclusaoForm(request.POST)
            if form.is_valid() and form.cleaned_data['confirmacao']:
                vaga_atual.delete()
                return redirect('dashboard_empresa')

        else:
            form = VagaExclusaoForm()

        context = {
            'vaga': vaga_atual,
            'form': form,
        }
        return render(request, 'empresas/excluir_vaga.html', context)
    else:
        return redirect('index')
    

@login_required(login_url="EmpresaLogin")
def charts(request):
    empresas = Empresa.objects.all()
    if request.user.is_authenticated and request.user in empresas:
        vagas_por_mes = vaga.objects.annotate(mes_cadastro=Extract('data_criado', 'month')).values('mes_cadastro').annotate(contagem=Count('id'))
        candidatos_por_mes = candidato.objects.annotate(mes_cadastro=Extract('data_criado', 'month')).values('mes_cadastro').annotate(contagem=Count('id'))

        meses_nomes = {
            1: 'Janeiro',
            2: 'Fevereiro',
            3: 'Março',
            4: 'Abril',
            5: 'Maio',
            6: 'Junho',
            7: 'Julho',
            8: 'Agosto',
            9: 'Setembro',
            10: 'Outubro',
            11: 'Novembro',
            12: 'Dezembro'
        }

        vagas_data = json.dumps(list(vagas_por_mes))
        candidatos_data = json.dumps(list(candidatos_por_mes))
        meses_nomes = json.dumps(meses_nomes)

        context = {
            'vagas_data': vagas_data,
            'candidatos_data': candidatos_data,
            'meses_nomes': meses_nomes
        }


        return render(request, 'empresas/charts.html', context)
    else:
        return redirect('index')
    
@login_required(login_url="EmpresaLogin")
def candidato_empresa(request, pk):
    empresas = Empresa.objects.all()
    if request.user.is_authenticated and request.user in empresas:
        candidato_atual = get_object_or_404(candidato, id=pk)
        context = {
            "candidato":candidato_atual
        }
        return render(request, 'empresas/candidato_visualizacao.html', context)
    else:
        return redirect('index')


@login_required(login_url="EmpresaLogin")
def dashboard_empresa(request):
    empresas = Empresa.objects.all()
    if request.user.is_authenticated and request.user in empresas:
        
        context = {
                'vagas': vaga.objects.all(),
                'vaga_candidatos': vaga_candidato.objects.all(),
                'candidatos': candidato.objects.all(),
                'usuario': request.user
            }
        return render(request, 'empresas/dashboard.html', context)
    else:
        return redirect('index')
    
    
@login_required(login_url="CandidatoLogin")
def dashboard_candidato(request):
    candidatos = candidato.objects.all()
    if request.user.is_authenticated and request.user in candidatos:
        print(request.user)
        context = {
                'vagas': vaga.objects.all(),
                'vaga_candidatos': vaga_candidato.objects.all(),
                'usuario': request.user
            }
        return render(request, 'candidatos/dashboard.html', context)
    else:
        return redirect('CandidatoLogin')
