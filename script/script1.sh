#!/bin/bash
PURPLE='0;35'
NC='\033[0m' 

echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Olá "$USER", bem-vindo ao script de instalação da Quality System."

instalar_docker() {
    echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Verificando docker..."
    sleep 2

    docker --version
    if [ $? -eq 0 ]
    then
        echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Você já possui o docker instalado!"
        sudo docker start ProjetoPI

        verificar_java
        
    else
        echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Você deseja instalar o docker? (sim/nao)"
        read docker

        if [ \"$docker\" == \"sim\" ];
        then
            echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Instalando Docker..."
            sleep 5

            sudo apt install docker.io -y
            echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Startando docker..."
            sleep 5

            sudo systemctl start docker

            echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Habilitando docker..."
            sleep 5

            sudo systemctl enable docker

            echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Baixando imagem do Mysql..."
            sleep 5

            sudo docker pull mysql:5.7

            echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Criando container do Mysql..."
            sleep 5

            sudo docker run -d -p 3306:3306 --name ProjetoPI -e "MYSQL_DATABASE=qualitySystem" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
            sleep 5

            chmod 777 tabelas.sh
            ./tabelas.sh

            verificar_java
        fi
    fi
}

abrir_software() {
    echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Você deseja abrir o software agora? (sim/nao)"
    read abrir

    if [ \"$abrir\" == \"sim\" ]; 
    then
        cd /home/$USER/Desktop/Quality-System/jar/jarProjeto

        sleep 1
        echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Abrindo nossa aplicação"
        java -jar teste-api-1.0-SNAPSHOT-jar-with-dependencies.jar
    else
        echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) OK, até a próxima!"
        exit 0
    fi
}

instalar_aplicacao() {
    echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Deseja realizar a instalação do software da Quality System? (sim/nao)"
        read repositorio

        if [ \"$repositorio\" == \"sim\" ]; 
        then
            mkdir /home/$USER/Desktop/Quality-System
            cd /home/$USER/Desktop/Quality-System

            git clone https://github.com/Ogabrielmonteiro/jar.git

            sleep 1

            abrir_software
        else
            echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Você optou por não instalar o software, até a próxima."
            exit 0
        fi
}

instalar_java() {
    echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Não foi identificado nenhuma versão do Java =("
    echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Você deseja realizar a instalação do Java? (sim/nao)"
    read confirm

    if [ \"$confirm\" == \"sim\" ];
    then

        echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Vamos realizar os updates dos pacotes..."
        sleep 1
        sudo add-apt-repository ppa:webupd8team/java -y

        echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Instalando... quase lá!"

        sudo apt update -y && sudo apt upgrade -y

        echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Instalando Java..."
        sleep 1
        sudo apt install default-jre -y

        echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Java instalado com sucesso"

        sleep 1

        instalar_aplicacao

        else
            echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Okay, você optou por não instalar o Java no momento, até a próxima."
            exit 0
    fi
}

verificar_java() {
    if [ "$(dpkg --get-selections | grep 'default-jre' | wc -l)" -eq "0" ]; 
        then
            instalar_java
        else
            echo "$(tput setaf 10)[Manivela]:$(tput setaf 7) Legal! Você já possui o Java instalado."
            instalar_aplicacao
    fi
}

instalar_docker