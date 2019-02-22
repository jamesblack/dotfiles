#!/usr/bin/env bash
# Most environment variables should be placed here, unless they're specific for
# some other piece of software, like NVM

# Paths: Should add one per line to make it easy to add/remove/change/read
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$DOTFILES/bin:$PATH"

# Elixir history
export ERL_AFLAGS="-kernel shell_history enabled"

# Shell config
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export EDITOR=vi
# https://github.com/npm/npm/issues/11696
export COMP_WORDBREAKS=${COMP_WORDBREAKS//:}
