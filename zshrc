#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

if ls ~/dotfiles/shell_scripts/* 1> /dev/null 2>&1; then
  for f in ~/dotfiles/shell_scripts/*; do
    source $f
  done
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
