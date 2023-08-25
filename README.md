### Termux Config Setup

O **Termux Config Setup** é um script conveniente projetado para simplificar o processo de atualização e aplicação das suas configurações personalizadas no emulador de terminal Termux. Com este script, você pode baixar facilmente as configurações mais recentes do seu repositório no GitHub e aplicá-las automaticamente ao ambiente Termux.

---

### Uso Pessoal

Este script foi desenvolvido para uso pessoal e customização das configurações do Termux. Ele é fornecido como uma ferramenta de conveniência para simplificar o processo de atualização de configurações específicas. Sinta-se à vontade para adaptá-lo conforme suas necessidades.

---

### Dependências

Para garantir que o script funcione corretamente, certifique-se de ter as seguintes dependências instaladas:

- **curl**: Uma ferramenta de linha de comando para transferir dados com URLs. O script usa o `curl` para fazer o download dos arquivos de configuração.

- **git**: Um sistema de controle de versão distribuído. O script pode precisar do `git` para clonar o repositório do GitHub que contém as configurações.

- **ruby (opcional)**: O `lolcat` é uma ferramenta que colore a saída do terminal. Se desejar usar o `lolcat` para adicionar cores ao output do script, você precisará do Ruby instalado para instalar o `lolcat`.

- **tput**: Uma ferramenta que oferece controle da tela terminal para manipular cores, cursor, entre outros. O script pode usar o `tput` para melhorar a formatação do output.

- **wget**: É uma ferramenta de linha de comando para transferir dados por URLs. É comumente usado para baixar arquivos da web, oferecendo opções para controlar a saída do arquivo, taxa de transferência, entre outras. É útil para automação e tarefas de administração.

---

### Uso

1. **Clonar o Repositório**: Comece clonando o seu repositório do GitHub para o seu dispositivo Termux.

    ```bash
    wget -O setup.sh https://raw.githubusercontent.com/SnowPerfectDev/Termux-Config-Setup/main/Termux-Config-Setup.sh
    ```

2. **Executar o Script**: Navegue até o diretório onde o script `Termux-Config-Setup.sh` está localizado e execute-o.

    ```bash
    chmod +x stup.sh && ./setup.sh
    ```

3. **Atualizar Suas Configurações**: O script irá automaticamente baixar os arquivos de configuração mais recentes, como `.bashrc`, `.nanorc`, `bash.bashrc` e `termux.properties`, do seu repositório no GitHub.

4. **Arquivo .bashrc Personalizado**: Se você quiser adicionar ou modificar seus próprios aliases e configurações no arquivo `.bashrc`, basta fazer as alterações diretamente no arquivo `.bashrc` no diretório do seu repositório. O script irá baixar e aplicar essa versão personalizada.

5. **Atualização Automática**: O script também permite criar um atalho para atualização de configurações. Ao executar o comando `update-termux-config`, o script irá baixar as configurações mais recentes e aplicá-las automaticamente ao seu Termux.

---

### Observação
- Após atualizar as configurações, saia e inicie uma nova sessão do Termux para ver as alterações aplicadas.
