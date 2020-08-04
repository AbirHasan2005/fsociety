#!/bin/bash

# Script for uninstalling fsociety tools.
# If you use any codes from here than give me credits.

# Coded by @AbirHasan2005

# My Telegram Group: http://t.me/linux_repo



clear
printf "\n\n\e[1;92m"


if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then # Config environment
    INSTALL_DIR="$PREFIX/usr/share/doc/fsociety"
    BIN_DIR="$PREFIX/bin/"
    BASH_PATH="$PREFIX/bin/bash"
    TERMUX=true
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
fi

printf "\n\e[1;91m[✔] Checking directories ...\n\e[0m"
if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
    rm "$BIN_DIR/fsociety*"
    sudo rm -rf "$INSTALL_DIR"
    sudo rm "$BIN_DIR/fsociety*"
else
    printf "\n\e[1;91m[✘] If you want to uninstall you must remove previous installations! \e[0m\n"
    printf "\n\e[1;91m[✘] Failed! \n\0m"
fi

printf "\n\e[1;92m[✔] Cleaning up old directories ...\n\0m"
if [ -d "$ETC_DIR/Manisso" ]; then
    echo "$DIR_FOUND_TEXT"
    if [ "$TERMUX" = true ]; then
        rm -rf "$ETC_DIR/Manisso"

    else
        sudo rm -rf "$ETC_DIR/Manisso"
    fi
else
    printf "\n\n\e[1;91m[!] Error\n\e[0m"
fi

clear
printf "\e[1;92m\n[✔] All good!\n\nJoin Telegram Group:\e[1;96m http://t.me/linux_repo\n\e[0m"
sleep 5
