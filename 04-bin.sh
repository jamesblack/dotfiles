if [ ! -d "~/.bin" ]; then
  mkdir ~/.bin
fi

export DOTFILES=~/.dotfiles

shopt -s dotglob

function e_header() {
  echo
  echo "======================================================================="
  echo -e "\033[1;36m$1\033[0m"
  echo "======================================================================="
}

e_header "Linking bin files to $HOME/.bin"

for file in $DOTFILES/04-bin/*; do
  echo "Linking $(basename $file)..."
  rm -rf "$HOME/.bin/$(basename $file)"
  ln -s "$file" "$HOME/.bin/$(basename $file)"
  chmod +x $file
done