# *********************************************
# * local: ${HOME}/.bashrc                   *
# * SnowPerfectDev                           *
# * Última modificação: Sexta-feira, 15 de dezembro 08:41:17 - 2023
# -----------------------------------------------
# * Configurações Gerais
# -----------------------------------------------

################# Configurações do Terminal #################

# Habilita checkwinsize
shopt -s checkwinsize

# Configuração do histórico de comandos
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups

################# Aliases #################

############# Comandos Básicos
alias ls='ls --color=auto'
alias ll='ls -alF'
alias l='ls -CF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
alias top='top -o %CPU'
alias h='history'
alias c='clear'
alias e='exit'
alias s='sudo'

############# Gerenciamento de Arquivos e Diretórios
alias lists='nano /etc/apt/sources.list'
alias tt='clear;termux-reload-settings && source ../usr/etc/bash.bashrc'
alias ttsu='clear; tsu'
alias ports='netstat -tuln'
alias mem='ps aux --sort -rss'
alias update='sudo apt update && sudo apt upgrade'
alias upgrade='sudo apt update && sudo apt upgrade'
alias updatezsh='source ~/.zshrc'
alias cdd='cd ~/Downloads'
alias cdm='cd ~/Music'
alias cdp='cd ~/Pictures'
alias cdd='cd ~/Documents'
alias cdw='cd ~/Workspace'
alias cdt='cd ~/Termux'
alias cds='cd ~/Scripts'
alias vi='vim'
alias updatepkg='pkg update && pkg upgrade'
alias rmrf='rm -rf'
alias mkdir='mkdir -p'

############# Navegação Rápida em Diretórios
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

############# Outros Utilitários
alias n='nano'
alias py='python'
alias py3='python3'
alias ip='curl ifconfig.me'
alias listen='nc -lvp'
alias myip='ip addr show wlan0 | grep inet | awk '\''{ print $2; }'\'''
alias cpuinfo='cat /proc/cpuinfo'
alias meminfo='cat /proc/meminfo'
alias diskinfo='df -h'
alias lsa='ls -a'

############# Ferramentas de Rede e Informações
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias calc='bc -l'
alias randpass='openssl rand -base64 12'
alias asciiart='curl http://artii.herokuapp.com/make\?text\=Termux'
alias diskusage='ncdu'
alias weather='curl wttr.in'
alias movieinfo='mediainfo'

############# Calendário e Timestamps
alias cal='cal -3'
alias timestamp='date +%s'

############# Criptografia e Segurança
alias encrypt='gpg -c'
alias decrypt='gpg -d'
alias cve='searchsploit'

############# Informações de Rede
alias whatismyip='curl ifconfig.me'
alias iptablesflush='iptables -F'

############# Comandos de Sistema
alias rebootsys='sudo reboot'
alias poweroffsys='sudo poweroff'
alias encryptfile='openssl aes-256-cbc -a -salt -in'
alias decryptfile='openssl aes-256-cbc -d -a -in'
alias qr='qrcode-terminal'

############# Cronômetros e Temporizadores
alias stopwatch='date && time read -sn 1 && echo && date'
alias timer='read -p "Digite o tempo em segundos: " secs && echo "Timer iniciado por $secs segundos." && sleep $secs && notify-send "Timer finalizado!"'

############# Testes de Rede
alias speedtest-cli='speedtest-cli --simple'
alias wifi='termux-wifi-connectioninfo'
alias battery='termux-battery-status'
alias shareterm='sshd'

############# Git e Controle de Versão
alias gitinit='git init'
alias gita='git add .'
alias gitc='git commit -m'
alias gitp='git push'
alias gitlog='git log'
alias gitconf='git config --global user.name "Seu Nome" && git config --global user.email "seuemail@exemplo.com"'

############# Saída do Terminal para Termbin
alias tb="nc termbin.com 9999 2>/dev/null || echo 'Falha ao conectar com termbin'"

############# Testes de Conexão com Ping
alias google='ping -t 3 www.google.com.br' # Ping ao Google a cada 3 segundos
alias uol='ping -t 3 www.uol.com.br' # Ping ao UOL a cada 3 segundos

################# Funções #################

############# Auxiliar de busca no histórico
# uso: his consulta1 consulta2 consultan...
# exemplo: his ssh 192 (busca todos os comandos ssh feitos para IPs incluindo 192)
# exemplo: his sed jsx react (busca todos os comandos sed que incluem "jsx" e "react")
function his() {
    # Armazena o histórico completo em uma variável
    commandlog=$(history | grep -oE "[a-zA-Z]{1}.*" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' | sort | uniq)

    # Para cada parâmetro fornecido a esta função, executa um grep case insensitive
    for var in "$@"; do
        commandlog=$(echo "$commandlog" | grep -i "$var")
    done

    # Exibe os resultados
    echo "$commandlog"
}

############# Localizador de IP
function @ip-locator() {
    local USAGE="uso: ip-locator <ip> [<ip>..]"
    [ "$1" == "-h" ] && (>&2 echo $USAGE) && return
    curl ipinfo.io/$1 && shift
    while [ "$1" != "" ]; do
        curl ipinfo.io/$1
        shift
    done
}

############# Resolvedor de IP de domínio
function @ip-resolver() {
    local USAGE="uso: ip-resolver <nome-domínio> [<nome-domínio>..]"
    [ "$1" == "-h" ] && (>&2 echo $USAGE) && return
    [ $# -eq 0 ] && (>&2 echo $USAGE) && return
    while [ "$1" != "" ]; do
        echo "$1 "
        dig +short @resolver1.opendns.com $1
        shift
    done
}

############# Validador de arquivos JSON
function jsv() {
    local USAGE="uso: jsv <arquivo.json> [<arquivo.json>..]"
    [ -z "$1" ] && (>&2 echo $USAGE) && return
    [ "$1" == "-h" ] && (>&2 echo $USAGE) && return
    command -v python3 >/dev/null 2>&1 || { echo >&2 "Comando python3 não encontrado"; return; }
    while [ "$1" != "" ]; do
        echo -n "$1: "
        cat $1 | python3 -m json.tool >/dev/null && echo "OK"
        shift
    done
}

############# Converte nomes de arquivos para minúsculas
function lcfile() {
    local USAGE="uso: lcfile <arquivo> [<arquivo>..]"

    [ "$1" = "" ] && (>&2 echo $USAGE) && return
    [ "$1" = "-h" ] && (>&2 echo $USAGE) && return
    [ "$1" = "--help" ] && (>&2 echo $USAGE) && return

    while [ "$1" != "" ]; do
        if [ -e "$1" ]; then
            local DST=$(dirname "$1")/$(basename "$1" | tr '[A-Z]' '[a-z]')
            [ ! -e "${DST}" ] && mv -T "$1" "${DST}" || (>&2 echo "falha ao renomear: $1")
        else
            (>&2 echo "arquivo inválido: $1")
        fi
        shift
    done
}

############# Substitui substring nos nomes dos arquivos
function rsfile() {
    local USAGE="uso: rsfile <string-busca> <string-substituição> <arquivo> [<arquivo>..]"
    local sstr=""
    local rstr=""

    while [ "${rstr}" == "" ]; do
        [ "$1" = "" ] && (>&2 echo $USAGE) && return
        [ "$1" = "-h" ] && (>&2 echo $USAGE) && return
        [ "$1" = "--help" ] && (>&2 echo $USAGE) && return
        if [ "${sstr}" == "" ]; then
            sstr="$1"
        else
            rstr="$1"
        fi
        shift
    done

    while [ "$1" != "" ]; do
        if [ -e "$1" ]; then
            local FNAME=$(basename "$1")
            local DST=$(dirname "$1")/${FNAME/${sstr}/${rstr}}
            [ ! -e "${DST}" ] && mv -T "$1" "${DST}" || (>&2 echo "falha ao renomear: $1")
        else
            (>&2 echo "arquivo inválido: $1")
        fi
        shift
    done
}

############# Remove caracteres não ASCII
function ascify() {
    local USAGE="uso: ascify <arquivo> [<arquivo> ..]"
    [ -z "$1" ] && (>&2 echo $USAGE) && return
    [ "$1" == "-h" ] && (>&2 echo $USAGE) && return
    while [ "$1" != "" ]; do
        tr -cd '\11\12\15\40-\176' <$1
        shift
    done
}

############# Remove espaços em branco no final
function trim-ws() {
    local USAGE="uso: trim-ws <arquivo> [<arquivo> ..]"
    [ -z "$1" ] && (>&2 echo $USAGE) && return
    [ "$1" == "-h" ] && (>&2 echo $USAGE) && return
    sed -i 's/[ \t]*$//' $@
}

############# Substitui tabs por espaços
function trim-tab() {
    local USAGE="uso: trim-tab <arquivo> [<arquivo> ..]"
    [ -z "$1" ] && (>&2 echo $USAGE) && return
    [ "$1" == "-h" ] && (>&2 echo $USAGE) && return
    command -v sponge >/dev/null 2>&1 || { echo >&2 "Sponge não encontrado. Instale moreutils"; return; }
    while [ "$1" != "" ]; do
        expand -t 4 "$1" | sponge "$1"
        shift
    done
}

############# Análise de assinatura de código
function code-analysis() {
    for i in $@; do
        echo -n "$i: "
        sed 's/[^"{};]//g' $i | tr -d '\n'
        echo
    done
}

############# Gera senha aleatória
function genpasswd() {
    local PWDLEN=${1:-32}
    tr -dc A-Za-z0-9_ </dev/urandom | head -c ${PWDLEN} | xargs
}

############# Gera código PIN
function genpin() {
    local PINLEN=${1:-4}
    tr -dc 0-9 </dev/urandom | head -c ${PINLEN} | xargs
}

############# Cifra Ceasar / ROT-13
function rot13() {
    if [ $# = 0 ]; then
        tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]"
    else
        tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]" <$1
    fi
}

############# Mostra threads de um processo
function atop() {
    [ -z "$1" ] && (>&2 echo "uso: atop <nome-processo>") && return
    top -H -p $(pgrep $1)
}

############# Lista comandos mais usados no histórico
function xtop() {
    local N=${1:-10}
    history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head -n $N
}

############# Encontra arquivos fonte C e C++
function c-src() {
    local USAGE="uso: c-src [diretório]"
    [ "$1" == "-h" ] && (>&2 echo $USAGE) && return
    local SRC=.
    [ -n "$1" ] && local SRC="$1"
    find ${SRC} -regextype posix-extended -regex "^.*\.(cpp|hpp|c|h)$" | grep -ve "^\.\/debian"
}

############# Encontra arquivos fonte Python
function py-src() {
    local USAGE="uso: py-src [diretório]"
    [ "$1" == "-h" ] && (>&2 echo $USAGE) && return
    local SRC=.
    [ -n "$1" ] && local SRC="$1"
    find ${SRC} -name "*.py"
}

############# Encontra arquivos fonte R
function r-src() {
    local USAGE="uso: r-src [diretório]"
    [ "$1" == "-h" ] && (>&2 echo $USAGE) && return
    local SRC=.
    [ -n "$1" ] && local SRC="$1"
    find ${SRC} -regex ".*\.[rR]"
}

############# Encontra arquivos JSON
function json-src() {
    local USAGE="uso: json-src [diretório]"
    [ "$1" == "-h" ] && (>&2 echo $USAGE) && return
    local SRC=.
    [ -n "$1" ] && local SRC="$1"
    find ${SRC} -iname "*.json"
}

############# Extrai arquivos compactados
function extract() {
    if [ -f "$1" ]; then
        case "$1" in
        *.tar.bz2) tar xjf "$1" ;;
        *.tar.gz) tar xzf "$1" ;;
        *.bz2) bunzip2 "$1" ;;
        *.rar) unrar x "$1" ;;
        *.gz) gunzip "$1" ;;
        *.tar) tar xf "$1" ;;
        *.tbz2) tar xjf "$1" ;;
        *.tgz) tar xzf "$1" ;;
        *.zip) unzip "$1" ;;
        *.Z) uncompress "$1" ;;
        *.7z) 7z x "$1" ;;
        *) echo "'$1' não pode ser extraído usando a função 'extract'" ;;
        esac
    else
        echo "'$1' não é um arquivo válido"
    fi
}

############# Clona repositório
function clone() {
    if [ $# -lt 1 ]; then
        echo "Uso: clone <url_repositório>"
        return 1
    fi

    default_destination="$HOME/clones"
    counter=1

    # Encontra o próximo número disponível para o diretório
    while [ -d "$default_destination/clone-$counter" ]; do
        counter=$((counter + 1))
    done

    destination="$default_destination/clone-$counter"

    git clone -q "$1" "$destination"
    if [ $? -ne 0 ]; then
        echo "Erro: Falha ao clonar."
        return 1
    fi

    echo "Clone realizado com sucesso. Repositório clonado para '$destination'"
}

############# Tratamento de comando não encontrado
command_not_found_handle() {
    local blue='\033[0;34m'
    local red='\033[0;31m'
    local yellow='\033[1;33m'
    local green='\033[0;32m'
    local reset='\033[0m'

    local cmd="$1"
    
    printf "${blue}Comando não encontrado:${red} $cmd${reset}\n"
    
    # Cache local de pacotes comuns do Termux
    case "$cmd" in
        adb|fastboot)
            printf "${green}Pacote disponível:${reset}\n"
            printf "  • pkg install android-tools\n"
            ;;
        git|curl|wget|python|node|npm|php|java|gcc|g++)
            printf "${green}Pacote disponível:${reset}\n"
            printf "  • pkg install $cmd\n"
            ;;
        docker|kubectl|terraform)
            printf "${yellow}Pacote não disponível no Termux${reset}\n"
            printf "  • Use proot-distro para Linux completo\n"
            ;;
        *)
            printf "${yellow}Verifique pacotes disponíveis:${reset}\n"
            printf "  • pkg search $cmd\n"
            ;;
    esac
    
    return 127
}

############# Função personalizada para cd
cd() {
    if [ "$1" == ".." ]; then
        builtin cd .. && ls
    elif [ -n "$1" ]; then
        builtin cd "$1" && ls
    else
        builtin cd && ls
    fi
}

############# Backup das configurações
function backup-bashrc() {
    cp ~/.bashrc ~/.bashrc.backup.$(date +%Y%m%d)
    echo "Backup do .bashrc criado!"
}

function restore-bashrc() {
    local latest_backup=$(ls -t ~/.bashrc.backup.* 2>/dev/null | head -n1)
    if [ -n "$latest_backup" ]; then
        cp "$latest_backup" ~/.bashrc
        source ~/.bashrc
        echo ".bashrc restaurado de: $latest_backup"
    else
        echo "Nenhum backup encontrado!"
    fi
}



crb() {
    b="/data/data/com.termux/files/usr/etc/bash.bashrc"
    [[ ! -f "$b" || $(wc -c < "$b" 2>/dev/null || echo 0) -lt 100 ]] && \
    [[ -f "${b}.bkp" ]] && \
    cat "${b}.bkp" > "$b" && \
    echo "✅ bash.bashrc restaurado!" && \
    { [[ $- == *i* ]] && source "$b" && echo "✅ Recarregado!"; } || \
    echo "✅ bash.bashrc OK"
}
