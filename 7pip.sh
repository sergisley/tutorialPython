PACOTE='ply'

# pip é o gerenciador de pacotes do python
# para instalar o pip execute no terminal linux ubuntu o comando:
sudo apt install python3-pip

# se você quiser ter um ambiente virtual separado por projeto para não embolar seus requisitos...
# criar ambiente virtual
pip install virtualenv
virtualenv venv

# ativar/entrar em seu ambiente virtual. você vai ver que o nome do ambiente virtual aparece entre parênteses no terminal
# entre nele para rodar o projeto e para instalar os pacotes
source venv/bin/activate

#só mandar instalar
pip install $PACOTE

# listar pacotes instalados em lista
pip freeze
pip freeze > requirements.txt

# listar pacotes instalados em tabela
pip list

# mostra infors sobre o pacote
pip show $PACOTE

# confere se o pacote tem dependencias
pip check $PACOTE

# bom, auto explicativo
pip uninstall $PACOTE