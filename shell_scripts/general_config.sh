# rbenv related things
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# hub related things
eval "$(hub alias -s)"
export GIT_EDITOR="nvim" # needed for hub

# aliases
alias vi="nvim"
alias dot="cd ~/dotfiles"
alias dotv="cd ~/dotfiles; vi init.vim"

alias gpr="hub pull-request --browse"
alias gcm="hub compare"
alias gci="hub ci-status -v"

alias be="bundle exec"
alias rake="bundle exec rake"
