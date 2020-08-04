#!/bin/bash
# Bash Script for install Fsociety tools.
# Must run to install tool.

# Modified by @AbirHasan2005

# Must give me credits if you use any codes from here.

# My Telegram Group: http://t.me/linux_repo



clear
printf "\n\e[1;92m
███████╗███████╗ ██████╗  ██████╗██╗███████╗████████╗██╗   ██╗
██╔════╝██╔════╝██╔═══██╗██╔════╝██║██╔════╝╚══██╔══╝╚██╗ ██╔╝
█████╗  ███████╗██║   ██║██║     ██║█████╗     ██║    ╚████╔╝
██╔══╝  ╚════██║██║   ██║██║     ██║██╔══╝     ██║     ╚██╔╝
██║     ███████║╚██████╔╝╚██████╗██║███████╗   ██║      ██║
╚═╝     ╚══════╝ ╚═════╝  ╚═════╝╚═╝╚══════╝   ╚═╝      ╚═╝

██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
\n\n" # Official Logo

sudo chmod +x uninstall.sh # Granting permission to uninstall.sh script

# Config Terminal environment
if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then
    INSTALL_DIR="$PREFIX/usr/share/doc/fsociety"
    BIN_DIR="$PREFIX/bin/"
    BASH_PATH="$PREFIX/bin/bash"
    TERMUX=true

    pkg install -y git python2 # Installing git and python2 package for Termux
elif [ "$(uname)" = "Darwin" ]; then
    INSTALL_DIR="/usr/local/fsociety"
    BIN_DIR="/usr/local/bin/"
    BASH_PATH="/bin/bash"
    TERMUX=false
else
    INSTALL_DIR="$HOME/.fsociety"
    BIN_DIR="/usr/local/bin/"
    BASH_PATH="/bin/bash"
    TERMUX=false

    sudo apt-get install -y git python2.7
fi

printf "\n[✔] Checking directories ...\n"
sleep 4
if [ -d "$INSTALL_DIR" ]; then
    printf "\n[◉] A directory fsociety was found! Do you want to replace it? [y/n]: " # Input
    read -r mama
    if [ "$mama" = "y" ]; then
        if [ "$TERMUX" = true ]; then
            rm -rf "$INSTALL_DIR"
            rm "$BIN_DIR/fsociety*"
        else
            sudo rm -rf "$INSTALL_DIR"
            sudo rm "$BIN_DIR/fsociety*"
        fi
    else
        printf "\n\e[1;91m[✘] If you want to install you must remove previous installations"
        printf "\n\e[1;91m[✘] Installation failed!\e[0m\n"
        exit
    fi
fi
printf "\n\e[1;92m[✔] Cleaning up old directories ...\n"
sleep 2
if [ -d "$ETC_DIR/AbirHasan2005" ]; then
    printf "$DIR_FOUND_TEXT"
    if [ "$TERMUX" = true ]; then
        rm -rf "$ETC_DIR/AbirHasan2005"
    else
        sudo rm -rf "$ETC_DIR/AbirHasan2005"
    fi
fi

printf "\e[0;92m[\e[1;92m✔\e[0;92m] Installing ...\e[0m\n"
sleep 5
printf "\n"
git clone --depth=1 https://github.com/AbirHasan2005/fsociety "$INSTALL_DIR";
echo "#!$BASH_PATH
python $INSTALL_DIR/fsociety.py" "${1+"$@"}" > "$INSTALL_DIR/fsociety";
chmod +x "$INSTALL_DIR/fsociety";
if [ "$TERMUX" = true ]; then
    cp "$INSTALL_DIR/fsociety" "$BIN_DIR"
    cp "$INSTALL_DIR/fsociety.cfg" "$BIN_DIR"
else
    sudo cp "$INSTALL_DIR/fsociety" "$BIN_DIR"
    sudo cp "$INSTALL_DIR/fsociety.cfg" "$BIN_DIR"
fi
rm "$INSTALL_DIR/fsociety";


if [ -d "$INSTALL_DIR" ] ;
then
    printf "\n"
    printf "\n\e[1;92m[✔] Tool installed successfully!\n\e[0m"
    printf "\n"
    printf "\n===================================================================="
    printf "\e[1;96m"
    printf "\n      All is done!! You can execute tool by typing \e[1;93mfsociety\e[1;92m !       "
    printf "\e[1;92m"
    printf "\n===================================================================="
    printf "\n\e[0m"
else
    printf "\e[1;91m[✘] Installation failed!\e[0m"
    exit
fi
