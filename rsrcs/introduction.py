title_and_topics = [
    '>>>introduzindo_e_resumindo<<<',
    'Criado por Guido van Rossum em 1991. Tem por fundamentais: simplicidade, legibilidade e facilidade de uso;',
    'não a tôa é a segunda mais popular linguagem de programação do mundo;',
    'usada principalmente para desenvolvimento backend. Tem ganhado bastante espaço graças ao uso pesado em machine learning e data engineering;'
    'comunidade e ecossistema: apoio de uma grande comunidade e ampla variedade de bibliotecas e frameworks;'
    'tipagem forte e dinâmica;',
    'multiparadigma: suporta funções anônimas e objetos;',
    'gerenciamento de pacotes: principal é o pip.'
]

def title():
    print(title_and_topics.pop(0))

def get_next_item():
    print(title_and_topics.pop(0))