#!/bin/bash

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
echo -e "\e[36m------------------------------------------------------\e[0m"
center_message "\e[36mDependency Installation Script\e[0m"
echo -e "\e[36m------------------------------------------------------\e[0m"
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

# Install Python pip if not installed
if ! is_package_installed_command "python"; then
    echo -e "\e[33mInstalling Python pip...\e[0m"
    yes | pkg install python
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
echo -e "\e[34mInstallation Summary:\e[0m"
echo -e "----------------------"

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
check_and_display "python"
check_and_display "lolcat"
check_and_display "tput"
check_and_display "ruby"
check_and_display "git"

echo -e "----------------------"
