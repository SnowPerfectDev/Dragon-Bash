" Plugins - Produtividade
call plug#begin('~/.vim/plugged')
  Plug 'vim-scripts/bash-support.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-grepper'
  Plug 'thinca/vim-quickrun'
call plug#end()

" Plugins - Interface
call plug#begin('~/.vim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'jiangmiao/auto-pairs'
  Plug 'Yggdroot/indentLine'
call plug#end()

" Plugins - Linting
call plug#begin('~/.vim/plugged')
  Plug 'vim-syntastic/syntastic'
  Plug 'dense-analysis/ale'
  Plug 'itspriddle/vim-shellcheck'
call plug#end()

" Configurações Gerais
set nu!
set tabstop=8
set softtabstop=3
set shiftwidth=3
set mouse=a
set cursorline
set encoding=utf-8
set autoindent
set incsearch
set wildmenu
set laststatus=2
set confirm

" Carregar arquivo de cores
source ~/.vim/themes/terroo-colors.vim

set title

" Mapeamentos de Teclas
nnoremap q :quit<CR>
nnoremap <C-s> :write<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
