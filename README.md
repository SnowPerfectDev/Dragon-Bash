<details closed>
  <summary><strong>Description</strong></summary>
### Dragon Bash
O **Dragon Bash** é um script conveniente projetado para simplificar o processo de atualização e aplicação das suas configurações personalizadas no emulador de terminal Termux. Com este script, você pode baixar facilmente as configurações mais recentes do repositório @SnowPerfectDev e aplicá-las automaticamente ao ambiente Termux.
</details>

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

### Comando
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/packages.sh)"
```

---

### Uso

1. **Executar o Script de Configuração**: Para começar, execute o seguinte comando no seu Termux para baixar e executar o script de configuração:

    ```bash
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/Termux-Config-Setup.sh)"
    
    ```

2. **Atualizar Suas Configurações**: O script irá automaticamente baixar os arquivos de configuração mais recentes, incluindo `.bashrc`, `.nanorc`, `bash.bashrc` e `termux.properties`
---

### Observação
- Após atualizar as configurações, saia e inicie uma nova sessão do Termux para ver as alterações aplicadas.
