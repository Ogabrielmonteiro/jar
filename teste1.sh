#!/bin/bash

## Removendo travas eventuais do apt ##

sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;

## Atualizando o repositório ##

sudo apt update

#Instalando a nossa aplicação

#Criando pasta do nosso projeto
mkdir /home/Quality-System

#Entrando na pasta
cd /home/Quality-System

#Clonando repositorio do GIT
sudo apt-add-repository 'https://github.com/Ogabrielmonteiro/jar.git'

