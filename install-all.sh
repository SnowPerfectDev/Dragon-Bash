
#!/bin/bash

# Pega a largura do terminal
tsize=$(stty size | cut -d ' ' -f 2)

# Função para imprimir linha com título centralizado
print_line() {
    local title="$1"       # título opcional
    local char="${2:-=}"   # caractere de separação (default '=')
    local color="${3:-}"   # código de cor ANSI opcional

    if [[ -z "$title" ]]; then
        # só a linha cheia
        echo -ne "$color"
        printf '%*s\n' "$tsize" '' | tr ' ' "$char"
        [[ -n "$color" ]] && echo -ne "\e[0m"
    else
        # calcula espaço dos lados
        local tlen=${#title}
        local pad=$(( (tsize - tlen - 2) / 2 ))  # -2 para espaços ao redor do título

        # imprime caracteres + espaço + título + espaço + caracteres
        echo -ne "$color"
        printf '%*s' "$pad" '' | tr ' ' "$char"
        printf ' %s ' "$title"
        printf '%*s\n' "$pad" '' | tr ' ' "$char"
        [[ -n "$color" ]] && echo -ne "\e[0m"
    fi
}

print_line "Instalando dependencias..." "-" "\e[33m"
echo ""
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/packages.sh)"
sleep 4 && clear
print_line "Configurando Termux (Dragon Bash" "-" "\e[33m"
echo ""
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/Termux-Config-Setup.sh)"

sleep 3; clear 
print_line "Baixando configurações do editor vim..." "-" "\e[33m"
echo ""
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/refs/heads/main/shell-config/install-theme/install.sh)"

# sleep 9; clear 
print_line "Recarregando configurações do Termux..." "-" "\e[36m"
echo ""
termux-reload-settings

echo ""
print_line "Instalação concluída!" "-" "\e[32m"
echo ""
