Alias para listar arquivos
alias ls='ls -h --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lha --color=auto'

# Alias para navegar diretórios
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Alias para comandos comuns
alias c='clear'
alias h='history'
alias e='exit'
alias g='git'
alias p='ping google.com'

# Alias para operações de sistema
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias top='htop'

# Alias para operações de pacotes (apt)
alias ai='sudo apt install'
alias ar='sudo apt remove'
alias au='sudo apt update && sudo apt upgrade'
alias as='apt search'
alias ag='apt show'

# Alias para proteção de operações perigosas
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Alias para pastas frequentemente usadas
alias home='cd ~'
alias docs='cd ~/Documents'
alias down='cd ~/Downloads'
alias desk='cd ~/Desktop'

# Alias para visualização de arquivos
alias cat='bat'
alias vi='vim'

# Alias para atalhos personalizados
alias llr='ls -lhtr --color=auto'

# Alias para criar pastas
alias mkdir='mkdir -p'

# Alias para exibir informações de rede
alias ip='ip -c a'
alias ports='netstat -tuln'
