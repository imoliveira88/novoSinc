from datetime import datetime, timedelta

ORDEM_INVERSA = 0
ORDEM_COMUM = 1
ORDEM_DATA_ORCL = 2

def trata_dia_ou_mes(diaMes):
	if(diaMes < 10):
		return f"{0}{diaMes}"
	else:
		return diaMes

def get_data(ordem, separador):
    data_atual = datetime.now()
    
    if ordem == ORDEM_INVERSA:
        data_atual_formatada = f"{data_atual.year}{separador}{trata_dia_ou_mes(data_atual.month)}{separador}{trata_dia_ou_mes(data_atual.day)}"
    else:
        data_atual_formatada = f"{trata_dia_ou_mes(data_atual.day)}{separador}{trata_dia_ou_mes(data_atual.month)}{separador}{data_atual.year}"
    
    return data_atual_formatada

def formatar_data(data, separador, ordem):
    data_formatada = datetime.strptime(data, "%Y-%m-%d")
    
    if ordem == ORDEM_INVERSA:
        data_formatada = f"{data_formatada.year}{separador}{trata_dia_ou_mes(data_formatada.month)}{separador}{trata_dia_ou_mes(data_formatada.day)}"
    elif ordem == ORDEM_COMUM:
        data_formatada = f"{trata_dia_ou_mes(data_formatada.day + 1)}{separador}{trata_dia_ou_mes(data_formatada.month)}{separador}{data_formatada.year}"
    elif ordem == ORDEM_DATA_ORCL:
        data_formatada = f"{trata_dia_ou_mes(data_formatada.year)}{separador}{trata_dia_ou_mes(data_formatada.day + 1)}{separador}{trata_dia_ou_mes(data_formatada.month)}"
    return data_formatada

def get_data_atual():
    data_atual = datetime.now()
    data_formatada = f"{trata_dia_ou_mes(data_atual.day)}/{trata_dia_ou_mes(data_atual.month)}/{data_atual.year}"
    hora_formatada = f"{data_atual.hour}:{trata_dia_ou_mes(data_atual.minute)}:{trata_dia_ou_mes(data_atual.second)}"
    data_atual_formatada = f"{data_formatada} {hora_formatada}"

    return data_atual_formatada

def get_hora_atual():
    data_atual = datetime.now()
    hora_atual = f"{data_atual.hour}:{data_atual.minute}:{data_atual.second}"

    return hora_atual

def get_data_atual_dmy():
    data_atual = datetime.now()
    data_atual_dmy = f"{trata_dia_ou_mes(data_atual.day)}/{trata_dia_ou_mes(data_atual.month + 1)}/{data_atual.year}"

    return data_atual_dmy

def calcular_diferenca_datas(data1, data2):
    data1 = datetime.strptime(data1, "%Y-%m-%d")
    data2 = datetime.strptime(data2, "%Y-%m-%d")

    diferenca = abs((data1 - data2).days)
    return diferenca

def trata_mes(utc_month):
    mes = [
        "Janeiro",
        "Fevereiro",
        "Março",
        "Abril",
        "Maio",
        "Junho",
        "Julho",
        "Agosto",
        "Setembro",
        "Outubro",
        "Novembro",
        "Dezembro"
    ]

    return mes[utc_month]

def formatar_data_por_extenso(data):
    aux_data = datetime.strptime(data, "%Y/%m/%d")
    dia = trata_dia_ou_mes(aux_data.day)
    mes = trata_mes(aux_data.month-1)
    ano = aux_data.year

    data_formatada = f"{dia} de {mes} de {ano}"

    return data_formatada