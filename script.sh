#!/bin/bash
echo "Olá "$USER", bem-vindo ao script de instalação da Quality System."
echo "Estamos verificando sua versão do java..."

sleep 2
java --version
if [ $? -eq 0 ]
    then
        echo "Legal! Você já possui o Java instalado."
    else
        echo "Não foi identificado nenhuma versão do Java =("
        echo "Você deseja realizar a instalão do Java? (sim/nao)"
        read install

        if [ \"$install\" == \"sim\" ]
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

                echo "Deseja realizar a instalação do software da Quality System? (sim/nao)"
                read repositorio

                if [\"$repositorio\" == \"sim\"]
                    then
                        mkdir /home/$USER/Desktop/Quality-System
                        cd /home/$USER/Desktop/Quality-System

                        git clone https://github.com/Ogabrielmonteiro/jar.git

                        sleep 2
                        clear

                        echo "Você deseja abrir o software agora? (sim/nao)"
                        read abrir

                        if [ \"abrir\" == \"sim\" ]
                            then
                                cd /home/$USER/Desktop/Quality-System/jar/jarProjeto
                                java -jar teste-api-1.0-SNAPSHOT-jar-with-dependencies.jar
                        fi
                    else
                        echo "Você optou por não instalar o software, até a próxima."
                fi
            else
                echo "Okay, você optou por não instalar o Java no momento, até a próxima."
        fi
fi
