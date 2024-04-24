**Dragon Bash** is a convenient script designed to simplify the process of updating and applying your custom settings in the Termux terminal emulator. With this script, you can easily download the latest settings from the @SnowPerfectDev repository and automatically apply them to the Termux environment.

---

### Personal Use

This script was developed for personal use and customization of Termux settings. It is provided as a convenience tool to streamline the process of updating specific configurations. Feel free to adapt it to your needs.

---

### Dependencies

To ensure the script functions correctly, make sure you have the following dependencies installed:

- **curl**: A command-line tool for transferring data with URLs. The script uses `curl` to download configuration files.

- **git**: A distributed version control system. The script may need `git` to clone the GitHub repository containing the configurations.

- **ruby (optional)**: `lolcat` is a tool that colors terminal output. If you wish to use `lolcat` to add colors to the script output, you'll need Ruby installed to install `lolcat`.

- **tput**: A tool that provides terminal screen control to manipulate colors, cursor, among others. The script may use `tput` to enhance output formatting.

- **wget**: A command-line tool for transferring data via URLs. It's commonly used for downloading files from the web, offering options to control file output, transfer rate, among others. It's useful for automation and administrative tasks.

### Command
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/packages.sh)"
```

---

### Usage

1. **Run the Configuration Script**: To begin, execute the following command in your Termux to download and run the configuration script:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SnowPerfectDev/Dragon-Bash/main/Termux-Config-Setup.sh)"  
```

2. **Update Your Configurations**: The script will automatically download the latest configuration files, including `.bashrc`, `.nanorc`, `bash.bashrc`, and `termux.properties`.

---

### Note
- After updating the configurations, exit and start a new Termux session to see the applied changes.