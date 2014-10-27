#!/bin/bash

echo "Installing GitConfig"

echo 

if [ -a $HOME/.gitconfig ]; then
    echo ".gitconfig exists, creating backup as .gitconfig-backup"
    mv $HOME/.gitconfig $HOME/.gitconfig-backup
fi


ln -s $HOME/my/dotfiles/gitconfig $HOME/.gitconfig

echo "DotFile Installation finished! Thanks!"