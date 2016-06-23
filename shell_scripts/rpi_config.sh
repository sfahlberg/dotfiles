if [ $(hostname) = "rpi" ]; then
  alias sudo='sudo -E' #to preserve the environment (vimrc, etc)
fi
