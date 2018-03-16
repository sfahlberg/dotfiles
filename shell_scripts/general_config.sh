# rbenv related things
export PATH="$HOME/.rbenv/bin:$PATH"
if rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# pyenv related things
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
   eval "$(pyenv init -)"
fi

# hub related things
alias git=hub
export GIT_EDITOR="nvim" # needed for hub

# aliases
alias vi='nvim `git diff --name-only`'
alias dot="cd ~/dotfiles"
alias dotv="cd ~/dotfiles; vi init.vim"

alias gpr="hub pull-request --browse"
alias gcm="hub compare"
alias gci="hub ci-status -v"

alias be="bundle exec"
alias rake="bundle exec rake"

alias stats="git shortlog -sn --since='10 weeks' --until='2 weeks'" # Leaderboards
alias recent='git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format="%(refname:short)"' # See Which Branches You Recently Worked On
alias recap="git log --all --oneline --no-merges --author=sam.fahlberg@gmail.com" # Remind Yourself What You’ve Been Up To
alias graph="git log --graph --all --decorate --stat --date=iso" # View Complex Logs
alias worddiff="git diff --word-diff"
