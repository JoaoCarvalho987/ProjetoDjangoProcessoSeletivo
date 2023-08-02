from django.contrib import admin


from .models import Empresa

@admin.register(Empresa)
class ProdutoAdmin(admin.ModelAdmin):
    list_display = ('nome_empresa', 'email_empresa', 'senha_empresa', 'data_criado', 'data_modificado')
