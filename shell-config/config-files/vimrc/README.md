```markdown
### Configuração Vim Personalizada

Este repositório contém minha configuração personalizada para o editor de texto Vim, incluindo plugins e ajustes específicos. A configuração visa melhorar a produtividade e proporcionar uma experiência de edição mais eficiente.

### Instalação

1. Clone este repositório para o diretório desejado:

   ```bash
   git clone https://github.com/SnowPerfectDev/Dragon-Bash/shell-config/vimrc/.vimrc.git ~/.vim
   ```

2. Instale os plugins utilizando seu gerenciador de plugins favorito. Neste exemplo, usamos vim-plug:

   ```bash
   # No Vim, execute
   :PlugInstall
   ```

3. Reinicie o Vim para aplicar as alterações.

## Plugins

### Produtividade
- [Bash Support](https://github.com/vim-scripts/bash-support.vim)
- [Vim Fugitive](https://github.com/tpope/vim-fugitive)
- [Vim Grepper](https://github.com/mhinz/vim-grepper)
- [Vim Quickrun](https://github.com/thinca/vim-quickrun)

### Interface
- [Vim Airline](https://github.com/vim-airline/vim-airline)
- [Auto Pairs](https://github.com/jiangmiao/auto-pairs)
- [Indent Line](https://github.com/Yggdroot/indentLine)

### Linting
- [Syntastic](https://github.com/vim-syntastic/syntastic)
- [ALE](https://github.com/dense-analysis/ale)
- [Vim Shellcheck](https://github.com/itspriddle/vim-shellcheck)

## Configurações Gerais

- Números de linhas visíveis
- Configuração de tabs e espaços
- Suporte a mouse
- Linha de cursor destacada
- Codificação UTF-8
- Configurações de identação e busca

## Mapeamentos de Teclas

- `q`: Sair do Vim
- `<C-s>`: Salvar o arquivo
- `<C-n>`: Alternar o NERDTree (explorador de arquivos)
- `<C-p>`: Pesquisar arquivos com fzf
- `<leader>w`: Salvar o arquivo
- `<leader>q`: Sair do Vim
- `<leader>e`: Abrir o explorador de arquivos

Para mover entre divisões: `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`

Sinta-se à vontade para ajustar e personalizar conforme suas preferências!
