# Command history tweaks:
# - Append history instead of overwriting
#   when shell exits.
# - When using history substitution, do not
#   exec command immediately.
# - Do not save to history commands starting
#   with space.
# - Do not save duplicated commands.
shopt -s histappend
shopt -s histverify
export HISTCONTROL=ignoreboth

# Default command line prompt.
PROMPT_DIRTRIM=2

# CORES
red='\e[1;31m'
green='\e[1;32m'
blue='\e[1;34m'
purple='\e[1;35m'
icyan='\e[1;36m'
white='\e[1;37m'
yellow='\e[1;33m'

# LOGO KALI
echo -e " ${red}
 ..............
             ..,;:ccc,.
           ......''';lxO.
 .....''''..........,:ld;                                     .';;;:::;,,.x,                               ..'''.            0Xxoc:,.  ...               ....                ,ONkc;,;cokOdc',.
 .                   OMo           ':ddo.                              dMc               :OO;
                     0M.                 .:o.
                     ;Wd
                      ;XO,
                        ,d0Odlc;,..
                            ..',;:cdOOd::,.
                                     .:d;.':;
                                        'd,  .'
                                          ;l   ..
                                           .o
                                             .
                                             .
                                             ."
echo -e " ${blue}                    Microjus

              Nenhum Sistema é Seguro
"

echo -e "${green}<${red}============${yellow}=========================${red}===========${green}>"
echo -e "\n${red}--------------${green}( D A R K - S H E L L )${red}-------------\n"
echo -e "${green}<${red}============${yellow}=========================${red}===========${green}>"

# Configurando o PS1
PS1='\[\033[01;31m\]┌─\[\033[01;34m\][\[\e[1;34m\]\[\033[01;32m\]MICROJUS\e[0m\]\[\033[01;34m\]]\[\033[01;31m\]┉\e[0m\]\[\033[01;34m\][\[\e[01;33m\]\t\e[0m\]\[\033[01;34m\]]\[\033[01;31m\]
┃\n\[\033[01;31m\]└─\[\033[01;34m\][\[\033[01;31m\] ${PWD/*\//} \[\033[01;34m\]]\[\033[01;31m\] -\[\033[01;32m\]} '

# Handles nonexistent commands.
# If user has entered command which invokes non-available
# utility, command-not-found will give a package suggestions.
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
fi

[ -r /data/data/com.termux/files/usr/share/bash-completion/bash_completion ] && . /data/data/com.termux/files/usr/share/bash-completion/bash_completion
