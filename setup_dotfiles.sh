#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
files="zpreztorc vimrc bash_profile profile gitconfig gitignore"    # list of files/folders to symlink in homedir

##########

# create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
create_symlinks () {
  for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
  done
}

install_vundle () {
  if [ ! -d ~/.vim/bundle/ ]; then
    echo 'cloning vundle'
    sudo mkdir ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  else
    echo 'vundle already installed'
  fi
}

install_zsh () {
  # Test to see if zshell is installed.  If it is:
  if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then

    # Clone my prezto repository from GitHub only if it isn't already present
    if [[ ! -d ~/.zprezto/ ]]; then
      echo 'cloning prezto'
      git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

      echo 'link prezto to dotfiles'
      #no readme or zpreztorc since I customize that
      array=$(ls "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/ | grep '[^README.md|zpreztorc]' )
      for rcfile in ${array[@]}; do
        ln -s "${ZDOTDIR:-$HOME}/.zprezto/runcoms/$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
      done
      zsh
      setopt EXTENDED_GLOB
    else
      echo 'prezto already installed'
    fi

    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
      echo 'making zsh the default'
      chsh -s $(which zsh)
    fi
  fi
}

install_tmux () {
  if which tmux &> /dev/null; then 
    echo 'tmux already installed'
  else
    # If tmux isn't installed, get the platform
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    echo $platform
    if [[ $platform == 'Linux' ]]; then
      echo 'installing tmux on Linux'
      sudo apt-get install tmux
      # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
      echo 'installing tmux on Mac'
      brew install tmux
    fi
  fi
}

create_symlinks
install_zsh
install_tmux
install_vundle
