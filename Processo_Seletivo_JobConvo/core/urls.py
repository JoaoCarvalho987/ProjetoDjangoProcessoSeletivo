from django.urls import path
from . import views

urlpatterns = [
    path('',views.index, name='index'),
    path('candidatos/', views.novo_candidato, name='novo_candidato'),
    path('candidatos/login/', views.login_candidato, name='CandidatoLogin'),
    path('candidatos/excluir/<int:vaga_id>', views.excluir_candidatura, name='deletar_vaga_candidato'),
    path('candidatos/criar/<int:vaga_id>', views.criar_candidatura, name='criar_candidatura'),
    path('empresas/nova_vaga/', views.nova_vaga, name='nova_vaga'),
    path('logout/', views.fazer_logout, name='logout'),
    path('empresas/edita_vaga/<int:id>', views.editar_vaga, name="vaga"),
    path('vagas/excluir/<int:vaga_id>', views.excluir_vaga, name='excluir_vaga'),
    path('empresas/login/', views.login_empresa, name='EmpresaLogin'),
    path('empresas/dashboard/', views.dashboard_empresa, name='dashboard_empresa'),
    path('candidatos/dashboard', views.dashboard_candidato, name='dashboard_candidato'),
    path('empresas/dashboard/charts/', views.charts, name='charts'),
    path('empresas/candidato/<int:pk>', views.candidato_empresa, name="candidato"),
    
]
