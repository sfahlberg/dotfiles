export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias vi="nvim"

eval "$(hub alias -s)"
export GIT_EDITOR="nvim" # needed for hub

alias dot="cd ~/dotfiles"
alias dotv="cd ~/dotfiles; vi init.vim"

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""' # displays all files in search

# Change iterm2 profile. Usage it2prof ProfileName (case sensitive)
dark() { echo -e "\033]50;SetProfile=dark\a" }
light() { echo -e "\033]50;SetProfile=light\a" }

# dark() { it2prof dark }
# light() { it2prof light }

alias gpr=hub pull-request --browse
alias gcm=hub compare
alias gci=hub ci-status -v

alias be="bundle exec"
alias rake="bundle exec rake"

_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  export FZF_DEFAULT_OPTS="
  --color bg+:$base01
  --color info:$red
  "
}
_gen_fzf_default_opts
