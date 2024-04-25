#!/bin/bash

# Function to clone the vim-themes repository
clone_repo() {
    git clone https://github.com/terroo/vim-themes || { echo "Error cloning the vim-themes repository."; exit 1; }
}

# Function to move the themes to the ~/.vim directory
move_themes() {
    mv vim-themes/themes ~/.vim || { echo "Error moving themes to ~/.vim."; exit 1; }
}

# Function to download Vim Plug
install_vim_plug() {
    curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || { echo "Error downloading Vim Plug."; exit 1; }
}

# Function to download ~/.vimrc if it doesn't exist
download_vimrc() {
    if [ ! -f "$HOME/.vimrc" ]; then
        curl -#sfLo ~/.vimrc --create-dirs \
            https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/shell-config/config-files/vimrc/.vimrc || { echo "Error downloading .vimrc file."; exit 1; }
    fi
}

# Add configuration to load the terroo-colors.vim file in ~/.vimrc
add_vimrc_config() {
    echo "source ~/.vim/themes/terroo-colors.vim" >> ~/.vimrc
}

# Check if the vim-themes directory already exists
if [ -d "vim-themes" ]; then
    echo "vim-themes directory already exists. Remove or move the directory before continuing."
    exit 1
fi

# Check if the ~/.vim directory already exists
if [ -d "$HOME/.vim" ]; then
    echo "~/.vim directory already exists. Remove or move the directory before continuing."
    exit 1
fi

# Clone the vim-themes repository
clone_repo; clear

# Create the ~/.vim directory and move the themes into it
mkdir -p ~/.vim && move_themes

# Download Vim Plug
install_vim_plug

# Download ~/.vimrc if it doesn't exist
download_vimrc

# Add configuration to ~/.vimrc to load the terroo-colors.vim file
add_vimrc_config

# Inform the user that installations have been completed
echo "Installations completed. Now you can open Vim and execute :PlugInstall to install the plugins."
