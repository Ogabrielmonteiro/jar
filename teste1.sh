#!/bin/bash

## Removendo travas eventuais do apt ##

sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;

## Atualizando o repositório ##

sudo apt update

#Instalando a nossa aplicação

#Criando pasta do nosso projeto
mkdir /home/ubuntu/Desktop/Quality-System

#Entrando na pasta
cd /home/ubuntu/Desktop/Quality-System

#Clonando repositorio do GIT
git clone https://github.com/Ogabrielmonteiro/jar.git

