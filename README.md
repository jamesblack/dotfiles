# Wanna boot DAT MACHINE!?

## Preformat

* commit any changes to this repository and push them
* THATS IT CAUSE I HAVE NO FEELINGS!

## Afterformat

* `git clone https://github.com/jamesblack/dotfiles.git ~/.dotfiles` - this will also install xcode command line tools
* `cd ~/.dotfiles`
* `cd sh 00-ohmyzsh.sh` - Installs oh my zsh
* `cd sh 01-bootstrap.sh` - Installs NVM and the latest node
* `cd sh 02-brew.sh` - Installs brew, cask, and the bundle defined in `03-brew/.Brewfile`
* `cd sh 03-link.sh` - Symlinks everything in `03-link` to `$HOME`
* `cd sh 04-bin.sh` - Symlinks everything in `03-bin` to `$HOME/.bin`
