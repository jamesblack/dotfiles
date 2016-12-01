export DOTFILES=~/.dotfiles
shopt -s dotglob
function e_header() {
  echo
  echo "======================================================================="
  echo -e "\033[1;36m$1\033[0m"
  echo "======================================================================="
}

e_header "Linking files to $HOME"

for file in $DOTFILES/03-link/*; do
  echo "Linking $(basename $file)..."
  rm -rf "$HOME/$(basename $file)"
  ln -s "$file" "$HOME/$(basename $file)"
done