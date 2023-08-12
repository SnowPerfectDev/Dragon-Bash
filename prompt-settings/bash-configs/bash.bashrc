# Colors
if [ -n "$(command -v tput)" ] && [ $(tput colors) -ge 8 ]; then
    rst="$(tput sgr0)"
    red="${rst}$(tput setaf 1)"
    bred="${rst}$(tput bold)$(tput setaf 1)"
    green="${rst}$(tput setaf 2)"
    yellow="${rst}$(tput setaf 3)"
    byellow="${rst}$(tput bold)$(tput setaf 3)"
    blue="${rst}$(tput setaf 4)"
    cyan="${rst}$(tput setaf 6)"
    bcyan="${rst}$(tput bold)$(tput setaf 6)"
    icyan="${rst}$(tput sitm)$(tput setaf 6)"
else
    red='\e[1;31m'
    green='\e[1;32m'
    blue='\e[1;34m'
    purple='\e[1;35m'
    icyan='\e[1;36m'
    white='\e[1;37m'
    yellow='\e[1;33m'
fi

# Função para imprimir espaço com margens
space() {
    printf '%*.*s %s %*.*s\n' "$1"
}
# Função para exibir o logotipo
print_logo() {
    local logo="
..............
            ..,;:ccc,.
          ......''';lxO.
.....''''..........,:ld;
           .';;;:::;,,.x,
      ..'''.            0Xxoc:,.  ...
  ....                ,ONkc;,;cokOdc',.
.                   OMo           ':ddo.
                    dMc               :OO;
                    0M.                 .:o.
                    ;Wd
                     ;XO,
                       ,d0Odlc;,..
                           ..',;:cdOOd::,.
                                    .:d;.':;.
                                       'd,  .'
                                         ;l   ..
                                          .o
                                            c
                                            .'
                                             .
"
    if [ -n "$(command -v lolcat)" ]; then
        echo "$logo" | lolcat
    else
        echo "$logo"
    fi
}
# Exibir o logotipo
print_logo
# Função para exibir o cabeçalho
print_header() {
echo -e "            ${green}⧏${red}=================${byellow}======${byellow}============${red}=================${green}⧐"
space 67
echo -e ${red}"-------------------------------${blue}{${bred}Obscure Society${blue}}${red}------------------------------"
space 67
echo -e "            ${green}⧏${red}=================${yellow}======${yellow}============${red}=================${green}⧐"
}
# Exibir o cabeçalho
print_header
space 78
PS1='\[\033[01;31m\]┌─\[\033[01;34m\][\[\e[1;34m\]\[\033[01;32m\]OS\033[01;34m\]x\033[01;32m\]OBS\e[0m\]\[\033[01;34m\]]\[\033[01;31m\]-\e[0m\]\[\033[01;34m\][\[\e[01;33m\]\t\e[0m\]\[\033[01;34m\]]\[\033[01;31m\]
┃\n\[\033[01;31m\]└─\[\033[01;34m\][\[\033[01;32m\]${PWD/*\//}\[\033[01;34m\]]\[\033[01;31m\]-\[\033[01;34m\]}\[\033[01;36m\] '


complete -W "update upgrade \
        install uninstall \
        search" pkg
