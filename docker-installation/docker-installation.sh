#!/bin/bash

#ubuntu 22.04

sudo apt-get update -y && apt-get upgrade -y

sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
apt-cache policy docker-ce

sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}

#docker aktif ediliyor
sleep 3
sudo systemctl start docker
sudo systemctl enable docker

printf '\nDocker kurulumu basarili \n\n'

#docker compose kuruluyor
sudo apt install -y docker-compose 

printf '\nDocker Compose Kurulumu başarılı\n\n'
