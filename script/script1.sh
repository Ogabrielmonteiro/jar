#!/bin/bash
echo "Olá "$USER", bem-vindo ao script de instalação da Quality System."
echo "Estamos verificando sua versão do java..."

sleep 2
java --version
if [ $? -eq 0 ]; 
then
    echo "Legal! Você já possui o Java instalado."
    echo "Deseja instalar nossa aplicação? (s/nao)"
    read macaco

    if [ \"$macaco\" == \"s\" ]; 
        then
            mkdir /home/$USER/Desktop/Quality-System
            cd /home/$USER/Desktop/Quality-System

            git clone https://github.com/Ogabrielmonteiro/jar.git

            sleep 2
            clear

            echo "Você deseja abrir o software agora? (s/nao)"
            read abrir

            if [ \"abrir\" == \"s\" ]; then
                cd /home/$USER/Desktop/Quality-System/jar/jarProjeto 

                

                java -jar teste-api-1.0-SNAPSHOT-jar-with-dependencies.jar
            fi
        else
            echo "Você optou por não instalar o software, até a próxima."
        fi
else
    echo "Não foi identificado nenhuma versão do Java =("
    echo "Você deseja realizar a instalão do Java? (s/nao)"
    read install

    if [ \"$install\" == \"s\" ]; 
    then
        echo "Vamos realizar os updates dos pacotes..."
        sleep 2
        sudo add-apt-repository ppa:webupd8team/java -y

        echo "Instalando... quase lá!"

        sudo apt update -y

        echo "Instalando Java..."
        sleep 2
        sudo apt install default-jre -y

        clear

        echo "Java instalado com sucesso"

        sleep 2

        echo "Deseja realizar a instalação do software da Quality System? (s/nao)"
        read repositorio

        if [ \"$repositorio\" == \"s\" ]; 
        then
            mkdir /home/$USER/Desktop/Quality-System
            cd /home/$USER/Desktop/Quality-System

            git clone https://github.com/Ogabrielmonteiro/jar.git

            sleep 2
            clear

            echo "Você deseja abrir o software agora? (s/nao)"
            read abrir

            if [ \"abrir\" == \"s\" ]; 
            then
                cd /home/$USER/Desktop/Quality-System/jar/jarProjeto

                sleep 2
                echo "Abrindo nossa aplicação"
                java -jar teste-api-1.0-SNAPSHOT-jar-with-dependencies.jar
            fi
        else
            echo "Você optou por não instalar o software, até a próxima."
        fi
    else
        echo "Okay, você optou por não instalar o Java no momento, até a próxima."
    fi
fi
