#!/bin/bash

## Removendo travas eventuais do apt ##

sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;

## Atualizando o repositório ##

sudo apt update

#Instalando a nossa aplicação

#Criando pasta do nosso projeto
mkdir /home/$USER/Desktop/Quality-System

#Entrando na pasta
cd /home/$USER/Desktop/Quality-System

#Clonando repositorio do GIT
git clone https://github.com/Ogabrielmonteiro/jar.git

#Entrando na pasta do clone
cd /home/$USER/Desktop/Quality-System/jar/3.0

#Instalando o jdk 11
sudo apt install default-jre -y

#Entrando na pasta do jar

#Executando o jar
java -jar teste-api-1.0-SNAPSHOT-jar-with-dependencies.jar

