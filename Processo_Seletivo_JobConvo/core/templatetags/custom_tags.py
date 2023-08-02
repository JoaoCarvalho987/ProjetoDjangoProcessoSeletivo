from django import template
from ..models import vaga_candidato, Empresa, vaga

register = template.Library()

@register.simple_tag
def quantidade_candidatos(vaga_id):
    return vaga_candidato.objects.filter(vaga_id=vaga_id).count()


@register.simple_tag
def get_candidate_names(vaga_id):
    candidatos = vaga_candidato.objects.filter(vaga_id=vaga_id)
    candidatos_info = []
    for candidato in candidatos:
        candidato_id = candidato.candidato.id
        candidato_info = f"{candidato.candidato.nome_candidato} - Pontos: {candidato.pontos}"
        candidatos_info.append(candidato_info)
    
    return  candidatos_info

@register.simple_tag
def get_candidate_ids(vaga_id):
    candidatos = vaga_candidato.objects.filter(vaga_id=vaga_id)
    candidatos_ids = [candidato.candidato.id for candidato in candidatos]
    return candidatos_ids[0]

@register.simple_tag
def get_empresa_names(empresa_id):
    try:
        empresa = Empresa.objects.get(id=empresa_id)
        return empresa.nome_empresa
    except Empresa.DoesNotExist:
        return "Empresa não encontrada"
    
    

@register.simple_tag
def get_vagas_do_usuario(user_id):
    try:
        vagas_candidato = vaga_candidato.objects.filter(candidato_id=user_id)
        vagas_ids = vagas_candidato.values_list('vaga_id', flat=True)
        vagas = vaga.objects.filter(id__in=vagas_ids)
        return vagas
    except vaga_candidato.DoesNotExist:
        return []