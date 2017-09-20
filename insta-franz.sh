#!/bin/bash

# Instalador Franz - Não Oficial
#
# Este script tem por objetivo auxiliar na instalação
# do aplicativo Franz no linux.
# 
# Apenas para distribuições baseadas no Debian

user=$(whoami)
SRC=/opt/franz
BIN=/usr/bin
app=/usr/share/applications

echo "Removendo arquivos antigos"
echo ""
sudo rm -rf ${SRC}
sudo rm -rf ${BIN}/franz
sudo rm -r ${app}/franz.desktop

echo "Começando a instalação"
echo ""
sudo mkdir ${SRC}

cd /home/${user}/Downloads/

sudo tar -vzxf franz.tgz -C ${SRC}

sudo ln -sf ${SRC}/Franz ${BIN}/franz

echo "Criando atalho"
echo ""
sudo touch ${app}/franz.desktop

sudo echo -e "[Desktop Entry]\nVersion=1.0\nType=Application\nTerminal=false\nName=franz\nExec=/opt/franz/Franz\nIcon=/opt/franz/resources/app.asar.unpacked/assets/franz.png\nCategories=Application;" > ${app}/franz.desktop

echo "Finalizando"
echo ""
sudo chmod +X ${app}/franz.desktop
