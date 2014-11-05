#!/bin/bash

function install {
	local dotGitConfig=$HOME/.gitconfig
	local sublimeSettings=$HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

	echo "Installing GitConfig"

	if [ -a $dotGitConfig ]; then
	    echo ".gitconfig exists, creating backup as .gitconfig-backup"
	    mv -f $dotGitConfig $dotGitConfig-backup
	fi

	ln -s $HOME/my/dotfiles/gitconfig $dotGitConfig

	if [ -a "$sublimeSettings" ]; then
		echo "sublimesettings exist, backing up as Preferences.sublime-settings.backup"
		mv -f "$sublimeSettings" "$sublimeSettings".backup
	fi

	ln -s $HOME/my/dotfiles/Preferences.sublime-settings "$sublimeSettings"
}

install

echo "DotFile Installation finished! Thanks!"
