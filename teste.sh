#!/bin/bash

## Removendo travas eventuais do apt ##

sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;

## Atualizando o repositório ##

sudo apt update

#Instalando a nossa aplicação

