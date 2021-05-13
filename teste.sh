#!/bin/bash
  echo "Selecione uma opção:"
  echo "1 - Atualizar repositorio"
  echo "2 - Instalar o java junto com o jar"
  echo "3 - Executar o jar”
 read opcao;
  case $opcao in
   “1”)
      ## Atualizando o repositório ##
      sudo apt update
      ;;
   “2”)
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
   ;;
   “3”)
    #Entrando na pasta do clone
cd /home/$USER/Desktop/Quality-System/jar/jarProjeto

#Executando o jar
java -jar teste-api-1.0-SNAPSHOT-jar-with-dependencies.jar
fi
  ;;
esac