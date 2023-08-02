from django import forms
from .models import candidato, vaga

class candidatoModelForm(forms.ModelForm):
    class Meta:
        model = candidato
        fields = ['nome_candidato', 'experiencia_candidato', 'pretensao_salarial', 'escolaridade', 'email_candidato', 'senha_candidato']

class VagaModelForm(forms.ModelForm):
    class Meta:
        model = vaga
        fields = ['nome_vaga', 'faixa_salarial', 'requisitos', 'escolaridade']

class VagaExclusaoForm(forms.Form):
    confirmacao = forms.BooleanField(
        required=True,
        widget=forms.HiddenInput,
        initial=True,
    )

class Vaga_candidatoExclusaoForm(forms.Form):
    confirmacao = forms.BooleanField(
        required=True,
        widget=forms.HiddenInput,
        initial=True,
    )



class EmpresaLoginForm(forms.Form):
    email_empresa = forms.EmailField(label='Email')
    senha_empresa = forms.CharField(label='Senha', widget=forms.PasswordInput)

    def clean(self):
        cleaned_data = super().clean()
        email = cleaned_data.get('email_empresa')
        senha = cleaned_data.get('senha_empresa')
        return cleaned_data
    
class CandidatoLoginForm(forms.Form):
    email = forms.EmailField(label='Email')
    senha = forms.CharField(widget=forms.PasswordInput, label='Senha')

    def clean(self):
        cleaned_data = super().clean()
        email = cleaned_data.get('email')
        senha = cleaned_data.get('senha')
        return cleaned_data
