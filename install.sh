#!/bin/bash

## pacotes essenciais
echo "Instalando pacotes essenciais..."
sudo apt-get install -y \
    apt-transport-https ca-certificates curl wget gnupg2 git build-essential \
    net-tools iputils-ping dnsutils traceroute htop iftop \
    software-properties-common

# preparando o ambiente
if [ ! -d /etc/apt/sources.list.d ]; then
    sudo mkdir -p /etc/apt/sources.list.d
fi

if [ ! -f /etc/apt/sources.list.d/usign-player.list ]; then
    echo "Instalando o repositório do usign-player..."
    sudo sh -c 'echo "deb "https://updater-static.usign.io/player-electron/0f4cbc1d43d1c2977c150844c6fdcd1c/linux/debian/" binary/" > /etc/apt/sources.list.d/usign-player.list'
    wget -O - https://updater-static.usign.io/public.key | sudo apt-key add -
fi

# instalação dos pacotes principais
sudo apt-get update

## atualização de pacotes
sudo apt-get upgrade -y

## instalacao do usign-player
echo "Instalando o usign-player..."
sudo apt-get install usign-player

if [ ! -f /etc/cron.hourly/usign-player ]; then
    sudo wget -O /etc/cron.hourly/usign-player https://raw.githubusercontent.com/jbtec-usign/wtlinux/main/maintenance.sh
    sudo chmod +x /etc/cron.hourly/usign-player
    if [ ! -f /etc/cron.hourly/usign-player ]; then
        echo "Falha ao instalar o script de manutenção!"
    fi
fi
