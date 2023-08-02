from django.contrib.auth.backends import BaseBackend
from .models import Empresa, candidato

class EmpresaBackend(BaseBackend):
    def authenticate(self, request, email=None, password=None):
        try:
            empresa = Empresa.objects.get(email_empresa=email)
            if empresa.senha_empresa == password:
                return empresa
        except Empresa.DoesNotExist:
            return None

    def get_user(self, user_id):
        try:
            return Empresa.objects.get(pk=user_id)
        except Empresa.DoesNotExist:
            return None

class CandidatoBackend(BaseBackend):
    def authenticate(self, request, email=None, password=None):
        try:
            candidato_atual = candidato.objects.get(email_candidato=email)
            if candidato_atual.senha_candidato == password:
                return candidato_atual
        except candidato.DoesNotExist:
            return None

    def get_user(self, user_id):
        try:
            return candidato.objects.get(pk=user_id)
        except candidato.DoesNotExist:
            return None