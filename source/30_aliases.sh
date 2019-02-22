#!/usr/bin/env bash
# A list of functions/aliases to use to make some things easier.
# - every software program ever. except for PHP maybe.

alias nowish='date +%Y-%m-%dT%H:%M:%S%z'

alias ..='cd ../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'

# makes a directory and moves to it
function dir() { mkdir -p "${1}" && builtin cd "$_" || exit; }

# gpg helpers
alias gpg-ls='gpg --list-secret-keys --keyid-format LONG'

# starts simple http server in current directory
alias static='python -m SimpleHTTPServer'

# docker helpers
alias docker-stop-containers='[[ "$(docker ps -a -q)" != "" ]] && docker stop $(docker ps -a -q)'
alias docker-remove-containers='docker-stop-containers && [[ "$(docker ps -a -q)" != "" ]] && docker rm $(docker ps -a -q)'
alias docker-remove-volumes='docker-remove-containers && [[ "$(docker volume ls -f dangling=true -q)" != "" ]] && docker volume rm $(docker volume ls -f dangling=true -q)'
alias docker-remove-images='[[ "$(docker images -a -q)" != "" ]] && docker rmi -f $(docker images -a -q)'
alias docker-clean='docker-stop-containers; docker-remove-containers; docker-remove-volumes; docker-remove-images; docker system prune -f'

# reverts to a given commit
function oh-crap() {
  if [[ "$1" == "" ]]; then
    echo 'You must pass in a commit id'
    return 1
  fi
  git reset --hard "$1"
  git reset --soft "HEAD@{1}"
  git commit -m "Revert to $1"
}

# removes branches that are no longer in origin
function git-prune-local() {
  local branches
  git checkout master
  git fetch -p
  branches="$(git branch -vv | awk '/: gone]/{print $1}')"
  if [[ "$branches" == "" ]]; then
    echo "All up to date"
    return 0
  fi
  echo -e "\nThis will remove the following branches locally:\n"
  printf '%s\n' "${branches[@]}"
  echo ''
  echo -n 'Proceed? '; read -r remove_branches
  case $remove_branches in
    [Yy]*)
      echo "$branches" | xargs git branch -D
      ;;
    *)
      echo "Alrighty then"
      ;;
  esac
}

# Open up coverage report
alias coverage='open coverage/lcov-report/index.html'

# Opens current github repo in a browser
alias github-open='open $(git remote get-url origin | sed "s/^git@\(.*\)\.com:\(.*\)\.git$/https:\/\/\1.com\/\2/g")'

# MD5 Checksum
alias checksum='openssl md5'

# sets default ls action to have trailing slashes at the end of directories
alias ls='ls -p'
alias la='ls -FGlAhp'
alias ll='la'

# Generates some self-signed certificates
alias generate-certs='openssl req -x509 -newkey rsa:2048 -nodes -sha256 -days 9999 -subj "/CN=localhost" -keyout localhost.key -out localhost.cert'

# macOS aliases/functions
# =======================
if is_macos; then
  alias slack-theme='echo "#1f1f1f,#303030,#21859c,#FFFFFF,#303030,#FFFFFF,#85d14b,#DB6668" | pbcopy; echo "copied!"'
  alias chime-off='sudo nvram SystemAudioVolume=%80'
  alias chime-on='sudo nvram -d SystemAudioVolume'

  # beep
  alias beep='echo -e "\a"'

  # get ip addresses
  alias myip='ipconfig getifaddr en0; curl ipecho.net/plain; echo'

  # upgrade/update shortcuts
  alias brew-upgrade='brew update; brew upgrade; brew cleanup'
  alias upgrade='brew-upgrade'

  # show/hide hidden files in finder
  alias show='defaults write com.apple.finder AppleShowAllFiles -bool TRUE; killall Finder;'
  alias hide='defaults write com.apple.finder AppleShowAllFiles -bool FALSE; killall Finder;'

  alias uuid='printf "%s" "$(uuidgen | tr ''[:upper:]'' ''[:lower:]'')"'
fi

# Ubuntu/Debian aliases/functions
# ========================
if is_ubuntu || is_debian; then
  alias slack-theme='echo "#1f1f1f,#303030,#21859c,#FFFFFF,#303030,#FFFFFF,#85d14b,#DB6668" | xclip -selection clipboard; echo "copied!"'
  # upgrade/update shortcuts
  alias apt-upgrade='sudo apt-get update -y; sudo apt-get upgrade -y; sudo apt-get autoremove -y'

  if is_ubuntu; then
    alias upgrade='apt-upgrade; sudo snap refresh'
  else
    alias upgrade='apt-upgrade'
  fi

  # Clear back buffer (like cmd + k)
  alias clear='clear && echo -en "\e[3J"'

  # sets default ls action to have trailing slashes at the end of directories
  alias ls='ls -p --color=auto'
  alias la='ls -FGlAhp --color=auto'

  # generates uuid
  alias uuid='cat /proc/sys/kernel/random/uuid'

  # open for linux
  function open() {
    xdg-open "$*" &>/dev/null
  }
fi

function ksmithut () {
  echo -e '
  \033[38;5;247m⣿⣿⣿⣿⣿⣿⣿⡇⠀\033[38;5;075m⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⠋
  \033[38;5;247m⣿⣿⡏⠉⠉⣿⡟⠁\033[38;5;075m⣠⣿⣿⠟⠉⠉⣩⣿⣿⡟⠁⠀
  \033[38;5;247m⣿⣿⡇⠀⠀⠋\033[38;5;075m⢀⣴⣿⣿⠋⠀⠀⣴⣿⣿⠏⠀⠀⠀
  \033[38;5;247m⣿⣿⡇⠀⠀\033[38;5;075m⢠⣾⣿⡿⠁⠀⢀⣾⣿⡿⠁⠀⠀⠀⠀
  \033[38;5;247m⣿⣿⡇⠀\033[38;5;075m⣰⣿⣿⠏⠀⠀⣰⣿⣿⠟⠀⠀⠀⠀⠀⠀
  \033[38;5;247m⣿⣿⡇⠀\033[38;5;075m⠹⣿⣿⣆⠀⠀⠹⣿⣿⣦⠀⠀⠀⠀⠀⠀
  \033[38;5;247m⣿⣿⡇⠀⠀\033[38;5;075m⠘⢿⣿⣷⡀⠀⠘⢿⣿⣷⡀⠀⠀⠀⠀
  \033[38;5;247m⣿⣿⡇⠀⠀⣄\033[38;5;075m⠈⠻⣿⣿⣄⠀⠀⠻⣿⣿⣆⠀⠀⠀
  \033[38;5;247m⣿⣿⡇⠀⠀⣿⣦⡀\033[38;5;075m⠙⣿⣿⣧⡀⠀⠙⢿⣿⣧⡀⠀
  \033[38;5;247m⣿⣿⡇⠀⠀⣿⣿⡇⠀\033[38;5;075m⠈⢻⣿⣷⡄⠀⠈⢻⣿⣿⣄
  \033[00m'
}
