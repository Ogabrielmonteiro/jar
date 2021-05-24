#!/bin/bash
echo "Olá "$USER", bem-vindo ao script de instalação da Quality System."
echo "Estamos verificando sua versão do java..."

abrir_software() {
    echo "Você deseja abrir o software agora? (s/nao)"
    read abrir

    if [ \"abrir\" == \"s\" ]; 
    then
        cd /home/$USER/Desktop/Quality-System/jar/jarProjeto

        sleep 1
        echo "Abrindo nossa aplicação"
        java -jar teste-api-1.0-SNAPSHOT-jar-with-dependencies.jar
    else
        echo "blz maluco"
        exit 0
    fi
}

instalar_aplicacao() {
    echo "Deseja realizar a instalação do software da Quality System? (s/nao)"
        read repositorio

        if [ \"$repositorio\" == \"s\" ]; 
        then
            mkdir /home/$USER/Desktop/Quality-System
            cd /home/$USER/Desktop/Quality-System

            git clone https://github.com/Ogabrielmonteiro/jar.git

            sleep 1

            abrir_software
        else
            echo "Você optou por não instalar o software, até a próxima."
            exit 0
        fi
}

instalar_java() {
    echo "Não foi identificado nenhuma versão do Java =("
    echo "Você deseja realizar a instalão do Java? (s/nao)"
    read java

    if [ \"$java\" == \"s\" ]; then
        echo "Vamos realizar os updates dos pacotes..."
        sleep 1
        sudo add-apt-repository ppa:webupd8team/java -y

        echo "Instalando... quase lá!"

        sudo apt update -y

        echo "Instalando Java..."
        sleep 1
        sudo apt install default-jre -y 1> /dev/null 2> /dev/stdout

        echo "Java instalado com sucesso"

        sleep 1

        instalar_aplicacao

        else
            echo "Okay, você optou por não instalar o Java no momento, até a próxima."
            exit 0

}

verificar_java() {
    if [ "$(dpkg --get-selections | grep 'default-jre' | wc -l)" -eq "0" ]; 
        then
            instalar_java
        else
            echo "Legal! Você já possui o Java instalado."
            instalar_aplicacao
}

verificar_java