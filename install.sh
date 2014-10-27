#!/bin/bash

echo "Installing GitConfig"

if [ -a ~/.gitconfig ]; then
    echo ".gitconfig exists, creating backup as .gitconfig-backup"
    mv ~/.gitconfig ~/.gitconfig-backup
fi

ln -s "$(pwd)/gitconfig" "$(dirname ~/.gitconfig)/.gitconfig"

echo "DotFile Installation finished! Thanks!"