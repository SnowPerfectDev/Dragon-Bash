---
### Termux Config Setup

O **Termux Config Setup** é um script conveniente projetado para simplificar o processo de atualização e aplicação das suas configurações personalizadas no emulador de terminal Termux. Com este script, você pode baixar facilmente as configurações mais recentes do seu repositório no GitHub e aplicá-las automaticamente ao ambiente Termux.

---

### Uso Pessoal

Este script foi desenvolvido para uso pessoal e customização das configurações do Termux. Ele é fornecido como uma ferramenta de conveniência para simplificar o processo de atualização de configurações específicas. Sinta-se à vontade para adaptá-lo conforme suas necessidades.

---

### Uso

1. **Clonar o Repositório**: Comece clonando o seu repositório do GitHub para o seu dispositivo Termux.

    ```bash
    git clone https://github.com/SnowPerfectDev/Termux-Config-Setup.git
    ```

2. **Executar o Script**: Navegue até o diretório onde o script `termux-config-update` está localizado e execute-o.

    ```bash
    cd Termux-Config-Setup
    ./Termux-Config-Setup.sh
    ```

3. **Atualizar Suas Configurações**: O script irá automaticamente baixar os arquivos de configuração mais recentes, como `.bashrc`, `.nanorc`, `bash.bashrc` e `termux.properties`, do seu repositório no GitHub.

4. **Arquivo .bashrc Personalizado**: Se você quiser adicionar ou modificar seus próprios aliases e configurações no arquivo `.bashrc`, basta fazer as alterações diretamente no arquivo `.bashrc` no diretório do seu repositório. O script irá baixar e aplicar essa versão personalizada.

5. **Atualização Automática**: O script também permite criar um atalho para atualização de configurações. Ao executar o comando `update-termux-config`, o script irá baixar as configurações mais recentes e aplicá-las automaticamente ao seu Termux.

---

### Observação

- Certifique-se de ajustar as URLs dos arquivos de configuração no script conforme necessário para refletir o seu repositório do GitHub.
- Após atualizar as configurações, saia e inicie uma nova sessão do Termux para ver as alterações aplicadas.
