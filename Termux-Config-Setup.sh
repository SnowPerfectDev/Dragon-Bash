#!/bin/bash

# Script para configurar as opções do Termux

# Cores ANSI
vermelho="\033[1;31m"
verde="\033[1;32m"
reset="\033[0m"

# Função para remover arquivos dentro da pasta ../usr/etc/
remove_files() {
    echo -e "[${verde}+${reset}] Removendo arquivos..."

    cd ~/../usr/etc/ || exit

    # Verificar se os arquivos existem antes de removê-los
    if [ -e motd.sh.dpkg-old ]; then
        rm -f motd.sh.dpkg-old
        echo -e "[${verde}+${reset}] Arquivo motd.sh.dpkg-old removido."
    fi

    if [ -e motd-playstore ]; then
        rm -f motd-playstore
        echo -e "[${verde}+${reset}] Arquivo motd-playstore removido."
    fi

    if [ -e motd.sh ]; then
        rm -f motd.sh
        echo -e "[${verde}+${reset}] Arquivo motd.sh removido."
    fi

    if [ -e motd ]; then
        rm -f motd
        echo -e "[${verde}+${reset}] Arquivo motd removido."
    fi

    echo -e "[${verde}+${reset}] Arquivos removidos com sucesso."
    cd - >/dev/null || exit
}

# Função para fazer backup de um arquivo
fazer_backup() {
    if [ -e "$1" ]; then
        cp "$1" "$1.bkp"
        echo -e "[${vermelho}+${reset}] Backup de $1 criado como $1.bkp"
    fi
}

# Função para baixar e aplicar uma configuração
baixar_e_aplicar() {
    URL="$1"
    ARQUIVO="$2"
    PASTA_DESTINO="$3"
    
    fazer_backup "$PASTA_DESTINO/$ARQUIVO"
    
    curl -sLo "$PASTA_DESTINO/$ARQUIVO" "$URL"
    echo -e "[${verde}+${reset}] Configuração $ARQUIVO aplicada"
}

echo -e "[${verde}+${reset}] Iniciando configurações do Termux..."

# Chamar a função para remover os arquivos
remove_files

# URL para bash.bashrc (URL original)
URL_BASH_BASHRC="https://raw.githubusercontent.com/SnowPerfectDev/Termux-Config-Setup/main/prompt-settings/bash-configs/bash.bashrc"
# URL para termux.properties
URL_TERMUX_PROPERTIES="https://raw.githubusercontent.com/SnowPerfectDev/Termux-Config-Setup/main/prompt-settings/termux-configs/termux.properties"
# URL para .nanorc
URL_NANORC="https://raw.githubusercontent.com/SnowPerfectDev/Termux-Config-Setup/main/shell-config/config-files/.nanorc"
# URL para colors.properties
URL_COLORS_PROPERTIES="https://raw.githubusercontent.com/SnowPerfectDev/Termux-Config-Setup/main/prompt-settings/color-schemes/colors.properties"
# URL para font.ttf
URL_FONT="https://raw.githubusercontent.com/SnowPerfectDev/Termux-Config-Setup/main/shell-config/config-files/font.ttf"
# URL para .bashrc (URL principal do repositório)
URL_BASHRC="https://raw.githubusercontent.com/SnowPerfectDev/Termux-Config-Setup/main/prompt-settings/bash-configs/.bashrc"

# Baixa e aplica a configuração do arquivo bash.bashrc
baixar_e_aplicar "$URL_BASH_BASHRC" "bash.bashrc" "/data/data/com.termux/files/usr/etc"
# Baixa e aplica a configuração do arquivo termux.properties
mkdir -p "$HOME/.termux"
baixar_e_aplicar "$URL_TERMUX_PROPERTIES" "termux.properties" "$HOME/.termux"
# Baixa e aplica a configuração do arquivo .nanorc
baixar_e_aplicar "$URL_NANORC" ".nanorc" "$HOME"
# Baixa e aplica a configuração do arquivo colors.properties
mkdir -p "$HOME/.termux"
baixar_e_aplicar "$URL_COLORS_PROPERTIES" "colors.properties" "$HOME/.termux"
# Baixa o arquivo font.ttf
mkdir -p "$HOME/.termux"
curl -sLo "$HOME/.termux/font.ttf" "$URL_FONT"
echo -e "[${verde}+${reset}] Arquivo font.ttf baixado para $HOME/.termux/font.ttf"
#
