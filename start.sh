#!/bin/bash

# !!! ATENÇÃO! PARA RODAR ESSE ARQUIVO, DIGITE NO CONSLE DO LINUX O COMANDO:
# sudo chmod +x start.sh && sudo bash start.sh
# Define o nome do ambiente virtual
venv_name="venv"

# Verifica privilégios de sudo
if [ "$EUID" -ne 0 ]; then
  echo "Este script requer privilégios de superusuário (sudo). Por favor, execute-o com sudo."
  exit 1
fi

echo "Inicializando o script de instalação"


# Verifica se o Python está instalado
if ! command -v python3 &>/dev/null; then
    echo "Python não encontrado. Instalando Python..."
    apt update
    apt install python -y
else
    echo "Python encontrado."
fi

# Verifica se o pip está instalado
if ! command -V pip &>/dev/null; then
    echo "gerenciador de pacotes pip não encontrado. Instalando pip..."
    apt install python3-pip -y
else
    echo "gerenciador de pacotes pip encontrado."
fi

# captura o nome do usuário original para executar os comandos como ele e não como root
original_user="$SUDO_USER"

# Verifica se o ambiente virtual está instalado
if ! command -v virtualenv &>/dev/null; then
    echo "biblioteca virtualenv não encontrada. Instalando virtualenv..."
    su -c "pip install virtualenv" "$original_user"
else
    echo "biblioteca virtualenv encontrada."
fi

# Cria um ambiente virtual
if [ ! -d "$venv_name" ]; then
    echo "Criando ambiente virtual $venv_name..."
     su -c "virtualenv $venv_name" "$original_user"
fi

# Ativa o ambiente virtual
su -c "source $venv_name/bin/activate" "$original_user"

# Instala as dependências do arquivo requirements.txt no ambiente virtual
if [ -f "requirements.txt" ]; then
    echo "Instalando as dependências do arquivo requirements.txt no ambiente virtual..."
    su -c "pip install -r requirements.txt" "$original_user"
else
    echo "Arquivo requirements.txt não encontrado. Não foi possível instalar as dependências."
fi
