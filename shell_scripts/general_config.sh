export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias vi="nvim"
alias dv="cd ~/dotfiles; vi init.vim"

export BROWSER=google-chrome-stable
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""' # displays all files in search

alias be="bundle exec"
alias ber="bundle exec rspec"
