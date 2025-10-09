#!/bin/bash

# Função para centralizar mensagens
center_message() {
    message="$1"
    termwidth=$(stty size | cut -d" " -f2)
    padding=""

    for ((i = 0; i < (termwidth - ${#message}) / 2; i++)); do
        padding+=" "
    done

    echo -e "$padding$message$padding"
}

# Função para exibir separador
show_separator() {
    termwidth=$(stty size | cut -d" " -f2)
    separator=$(printf '%*s' "$termwidth" | tr ' ' '=')
    echo -e "\033[1;36m$separator\033[0m"
}

# Função para executar comandos com tratamento de erro
execute_command() {
    local command="$1"
    local description="$2"
    
    center_message "\033[1;33m$description\033[0m"
    echo ""
    
    if eval "$command"; then
        center_message "\033[1;32m$description concluído com sucesso!\033[0m"
    else
        center_message "\033[1;31mErro ao executar: $description\033[0m"
        echo -e "\033[1;31mDeseja continuar mesmo assim? (s/N): \033[0m"
        read -r continue_exec
        if [[ ! "$continue_exec" =~ ^[Ss]$ ]]; then
            echo -e "\033[1;31mExecução interrompida.\033[0m"
            exit 1
        fi
    fi
    echo ""
}

# Cabeçalho principal
clear
show_separator
center_message "\033[1;35mDRAGON BASH INSTALLER\033[0m"
center_message "\033[1;36mConfiguração Automática para Termux\033[0m"
show_separator
echo ""

# Verificar se está no Termux
if [[ ! -d "/data/data/com.termux/files/usr" ]]; then
    center_message "\033[1;31mAVISO: Este script é destinado para uso no Termux!\033[0m"
    echo ""
    read -p "Deseja continuar mesmo assim? (s/N): " -r continue_anyway
    if [[ ! "$continue_anyway" =~ ^[Ss]$ ]]; then
        exit 1
    fi
fi

# Atualizar repositórios
execute_command \
    "pkg update -y && pkg upgrade -y" \
    "ATUALIZANDO REPOSITÓRIOS E PACOTES"

# Instalar dependências básicas
execute_command \
    "pkg install -y curl wget git" \
    "INSTALANDO DEPENDÊNCIAS BÁSICAS"

# Executar os scripts do Dragon Bash
execute_command \
    "bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/refs/heads/main/shell-config/install-theme/install.sh)\"" \
    "INSTALANDO TEMA DO DRAGON BASH"

execute_command \
    "bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/Termux-Config-Setup.sh)\"" \
    "CONFIGURANDO TERMUX"

execute_command \
    "bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/packages.sh)\"" \
    "INSTALANDO PACOTES ADICIONAIS:"

# Mensagem final
show_separator
center_message "\033[1;32mINSTALACAO CONCLUIDA!\033[0m"
center_message "\033[1;36mConfiguração do Dragon Bash finalizada com sucesso!\033[0m"
echo ""
center_message "\033[1;33mReinicie o Termux para aplicar todas as mudanças:\033[0m"
center_message "\033[1;35mexit\033[0m"
center_message "\033[1;35m(Feche e reabra o app)\033[0m"
show_separator
