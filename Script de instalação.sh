#!/bin/bash
## Removendo travas eventuais do apt ##

sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;

echo "Olá "$USER",já vamos começar a sua intalação."
echo "Deseja atualizar seu repositorio e instalar o java para rodar o programa? (sim/nao)"
read repositorio

if [$repositorio == "sim"];
then
## Atualizando o repositório ##
sudo apt update

#Criando pasta do nosso projeto
mkdir /home/$USER/Desktop/Quality-System

#Entrando na pasta
cd /home/$USER/Desktop/Quality-System

#Clonando repositorio do GIT
git clone https://github.com/Ogabrielmonteiro/jar.git

#Instalando o jdk 11
sudo apt install default-jre -y

#Entrando na pasta do clone
cd /home/$USER/Desktop/Quality-System/jar/jarProjeto

#Executando o jar
java -jar teste-api-1.0-SNAPSHOT-jar-with-dependencies.jar

elif [$repositorio == "nao"];
then
echo "OK, vou abrir o programa direto"

#Entrando na pasta do clone
cd /home/$USER/Desktop/Quality-System/jar/jarProjeto

#Executando o jar
java -jar teste-api-1.0-SNAPSHOT-jar-with-dependencies.jar
fi

