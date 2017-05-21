if [ $(hostname) = "rpi" ]; then
  alias sudo='sudo -E' #to preserve the environment (vimrc, etc)

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh" # This loads nvm

  # Auto start a session when Zsh is launched in a local terminal.
  zstyle ':prezto:module:tmux:auto-start' local 'yes'

  # Auto start a session when Zsh is launched in a SSH connection.
  zstyle ':prezto:module:tmux:auto-start' remote 'yes'
fi
