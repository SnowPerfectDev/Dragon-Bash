
#!/bin/bash

# Get terminal width
tsize=$(stty size | cut -d ' ' -f 2)

# Function to print line with centered title
print_line() {
    local title="$1"       # optional title
    local char="${2:-=}"   # separator character (default '=')
    local color="${3:-}"   # optional ANSI color code

    if [[ -z "$title" ]]; then
        # full line only
        echo -ne "$color"
        printf '%*s\n' "$tsize" '' | tr ' ' "$char"
        [[ -n "$color" ]] && echo -ne "\e[0m"
    else
        # calculate space on sides
        local tlen=${#title}
        local pad=$(( (tsize - tlen - 2) / 2 ))  # -2 for spaces around title

        # print characters + space + title + space + characters
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

# Function to check if a package is installed using command -v
is_package_installed_command() {
   if command -v "$1" &>/dev/null; then
       return 0 # Package is installed
   else
       return 1 # Package is not installed
   fi
}

# Function to check if a package is installed
is_package_installed() {
   package_name="$1"
   if [ "$(dpkg -l | grep -w "ii  $package_name")" ]; then
       return 0 # Package is installed
   else
       return 1 # Package is not installed
   fi
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

# Check and install curl if not installed
if ! is_package_installed_command "curl"; then
    echo -e "\e[33mInstalling curl...\e[0m"
    yes | pkg install curl
    echo ""
fi

# Check and install wget if not installed
if ! is_package_installed_command "wget"; then
    echo -e "\e[33mInstalling wget...\e[0m"
    yes | pkg install wget
    echo ""
fi

# Check and install tput if not installed
if ! is_package_installed_command "tput"; then
    echo -e "\e[33mInstalling tput...\e[0m"
    yes | pkg install ncurses-utils
    echo ""
fi

# Install Ruby if not installed
if ! is_package_installed_command "ruby"; then
    echo -e "\e[33mInstalling Ruby...\e[0m"
    yes | pkg install ruby
    echo ""
fi

# Install the 'lolcat' gem if not installed
if ! is_package_installed "lolcat"; then
    echo -e "\e[33mInstalling the 'lolcat' gem...\e[0m"
    yes | gem install lolcat
    echo ""
fi

# Install Git if not installed
if ! is_package_installed_command "git"; then
    echo -e "\e[33mInstalling Git...\e[0m"
    yes | pkg install git
    echo ""
fi

# Completion message
echo ""
echo -e "\e[32mDependency installation completed!\e[0m"
echo ""

# Final summary
print_line "Installation Summary" "-" "\e[34m"

# Function to check and display the installation status of each dependency
check_and_display() {
    if is_package_installed_command "$1"; then
        echo -e "$1: \e[32mInstalled\e[0m"
    else
        echo -e "$1: \e[31mNot installed (Error)\e[0m"
    fi
}

check_and_display "curl"
check_and_display "wget"
check_and_display "lolcat"
check_and_display "tput"
check_and_display "ruby"
check_and_display "git"

print_line "" "-" "\e[34m"
