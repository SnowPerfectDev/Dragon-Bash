#!/usr/env/bin bash

# ============================================================================
# CONFIGURAÇÃO DE PACOTES - Adicione ou remova pacotes aqui
# ============================================================================

# Pacotes PKG (formato: "comando:pacote" ou apenas "comando")
PKG_PACKAGES=(
    "curl"
    "wget"
    "tput:ncurses-utils"
    "ruby"
    "git"
    "vim"
    "bat"
    "lsd"
)

# Ruby Gems
GEM_PACKAGES=(
    "lolcat"
)

# ============================================================================

# Get terminal width
tsize=$(stty size | cut -d ' ' -f 2)

# Function to print line with centered title
print_line() {
    local title="$1"
    local char="${2:-=}"
    local color="${3:-}"

    if [[ -z "$title" ]]; then
        echo -ne "$color"
        printf '%*s\n' "$tsize" '' | tr ' ' "$char"
        [[ -n "$color" ]] && echo -ne "\e[0m"
    else
        local tlen=${#title}
        local pad=$(( (tsize - tlen - 2) / 2 ))

        echo -ne "$color"
        printf '%*s' "$pad" '' | tr ' ' "$char"
        printf ' %s ' "$title"
        printf '%*s\n' "$pad" '' | tr ' ' "$char"
        [[ -n "$color" ]] && echo -ne "\e[0m"
    fi
}

# Function to centrally align a message 
center_message() {
   message="$1"
   termwidth=$(stty size | cut -d" " -f2)
   padding=""

   for ((i = 0; i < (termwidth - ${#message}) / 2; i++)); do
       padding+=" "
   done

   echo -e "\e[34m$padding$message$padding\e[0m"
}

# Custom header
clear
print_line "" "-" "\e[36m"
center_message "Dependency Installation Script"
print_line "" "-" "\e[36m"
echo ""

# Update repositories and packages
echo -e "\e[33mUpdating repositories and packages...\e[0m"
yes | pkg update
echo ""

# Perform upgrade
echo -e "\e[33mPerforming package upgrade...\e[0m"
yes | pkg upgrade 
echo ""

# Install PKG packages
for pkg_entry in "${PKG_PACKAGES[@]}"; do
    IFS=':' read -r cmd pkg_name <<< "$pkg_entry"
    pkg_name="${pkg_name:-$cmd}"
    
    if ! command -v "$cmd" &>/dev/null; then
        echo -e "\e[33mInstalling $pkg_name...\e[0m"
        pkg install -y "$pkg_name"
        echo ""
    fi
done

# Install Ruby gems
for gem_name in "${GEM_PACKAGES[@]}"; do
    if ! command -v "$gem_name" &>/dev/null; then
        echo -e "\e[33mInstalling the '$gem_name' gem...\e[0m"
        gem install "$gem_name"
        echo ""
    fi
done

# Completion message
echo ""
echo -e "\e[32mDependency installation completed!\e[0m"
echo ""

# Final summary
print_line "Installation Summary" "-" "\e[34m"

# Check packages
for pkg_entry in "${PKG_PACKAGES[@]}"; do
    IFS=':' read -r cmd pkg_name <<< "$pkg_entry"
    
    if command -v "$cmd" &>/dev/null; then
        echo -e "$cmd: \e[32mInstalled\e[0m"
    else
        echo -e "$cmd: \e[31mNot installed (Error)\e[0m"
    fi
done

# Check gems
for gem_name in "${GEM_PACKAGES[@]}"; do
    if command -v "$gem_name" &>/dev/null; then
        echo -e "$gem_name: \e[32mInstalled\e[0m"
    else
        echo -e "$gem_name: \e[31mNot installed (Error)\e[0m"
    fi
done

print_line "" "-" "\e[34m"
