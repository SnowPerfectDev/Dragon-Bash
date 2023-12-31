#!/bin/bash

# Cores ANSI
vermelho="\033[1;31m"
verde="\033[1;32m"
reset="\033[0m"

# Função para ocultar o cursor na tela
HIDECURSOR() {
    echo -en "\033[?25l"
}
HIDECURSOR

# Função para restaurar as configurações normais do terminal, incluindo a visibilidade do cursor
NORM() {
    echo -en "\033[?12l\033[?25h"
}

# Função para exibir mensagens de sucesso em verde
exibir_sucesso() {
    mensagem="$1"
    echo -e "${reset}[${verde}+${reset}] ${mensagem}"
sleep 2
}

# Função para exibir mensagens de alertas em vermelho
exibir_alerta() {
    mensagem="$1"
    echo -e "[${vermelho}!${reset}] ${mensagem}"
    echo
}

# Função para exibir mensagens de erro em vermelho
exibir_erro() {
    mensagem="$1"
    echo -e "[${vermelho}!${reset}] ${mensagem}"
}

# Função para remover arquivos dentro da pasta ../usr/etc/
remove_files() {
    exibir_alerta "Removendo arquivos..."

    cd ~/../usr/etc/ || {
        exibir_erro "Não foi possível acessar o diretório."
        exit 1
    }

    # Arquivos a serem removidos
    arquivos=("motd" "motd.sh" "motd-playstore")

    for arquivo in "${arquivos[@]}"; do
        if [ -e "$arquivo" ]; then
            rm -f "$arquivo"
            exibir_alerta "Arquivo $arquivo removido."
        fi
    done

    exibir_sucesso "Arquivos removidos com sucesso."
    cd - >/dev/null || exit
}

# Função para baixar e aplicar uma configuração
baixar_e_aplicar() {
    URL="$1"
    ARQUIVO="$2"
    PASTA_DESTINO="$3"

    # Fazer backup se o arquivo existir
    if [ -e "$PASTA_DESTINO/$ARQUIVO" ]; then
        cp "$PASTA_DESTINO/$ARQUIVO" "$PASTA_DESTINO/$ARQUIVO.bkp"
        exibir_sucesso "Backup de $ARQUIVO criado como $ARQUIVO.bkp"
    fi

    exibir_sucesso "Baixando $ARQUIVO..."
    if curl -sLo "$PASTA_DESTINO/$ARQUIVO" "$URL"; then
        exibir_sucesso "Configuração $ARQUIVO aplicada"
        return 0
    else
        exibir_erro "Falha ao baixar $ARQUIVO"
        return 1
    fi
}

exibir_sucesso "Iniciando configurações do Termux..."

# URLs centralizadas
declare -A urls=(
    ["bash.bashrc"]="https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/prompt-settings/bash-configs/bash.bashrc"
    ["termux.properties"]="https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/prompt-settings/termux-configs/termux.properties"
    [".nanorc"]="https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/shell-config/config-files/.nanorc"
    ["colors.properties"]="https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/prompt-settings/color-schemes/colors.properties"
    ["font.ttf"]="https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/shell-config/config-files/font.ttf"
    [".bashrc"]="https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/prompt-settings/bash-configs/.bashrc"
)

# Chamar a função para remover os arquivos
remove_files

# Baixar e aplicar as configurações
total_arquivos="${#urls[@]}"
contador=0

for arq in "${!urls[@]}"; do
    contador=$((contador + 1))
    
    if [ "$arq" = ".nanorc" ]; then
        destino="$HOME"  # Copiar o .nanorc para a pasta home
    elif [ "$arq" = ".bashrc" ]; then
        destino="$HOME"  # Copiar o .bashrc para a pasta home
    elif [ "$arq" = "bash.bashrc" ]; then
        destino="$HOME/../usr/etc"  # Copiar o bash.bashrc para a pasta ~/../usr/etc
    else
        destino="$HOME/.termux"  # Demais arquivos vão para a pasta .termux
    fi

    if baixar_e_aplicar "${urls[$arq]}" "$arq" "$destino"; then
       exibir_alerta "Progresso: $contador de $total_arquivos arquivos"
    fi
done

exibir_sucesso "Configurações concluídas."
NORM