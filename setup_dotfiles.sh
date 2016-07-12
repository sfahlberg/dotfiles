#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

########## Variables

dir=~/dotfiles                    # dotfiles directory
files="zpreztorc vimrc gitconfig gitignore tmux.conf"    # list of files/folders to symlink in homedir
packages_mac="vim tmux zsh pick the_silver_searcher"
packages_linux="vim tmux zsh pick silversearcher-ag"

# create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
create_symlinks () {
  for file in $files; do
    ln -s $dir/$file ~/.$file
  done
}

install_homebrew () {
  if which brew &> /dev/null; then
    echo 'brew already installed'
  else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

install_vundle () {
  if [ ! -d ~/.vim/bundle/ ]; then
    echo 'cloning vundle'
    mkdir ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
  else
    echo 'vundle already installed'
  fi
}

install_prezto () {
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
}

set_zsh_as_default () {
  if [[ $(echo $SHELL) == $(which zsh) ]]; then
    echo 'making zsh the default'
    chsh -s $(which zsh)
  else
    echo 'zsh already the default'
  fi
}

download_linux_packages () {
  echo 'Linux detected'
  for package in $packages_linux; do
    echo 'installing: $package'
    sudo apt-get install $package
  done
}

download_mac_packages () {
  echo 'Mac detected'
  for package in $packages_mac; do
    echo "installing: $package"
    brew install $package
  done
}

install_powerline_fonts () {
  if [[ ! -d ~/.fonts/ ]]; then
    echo 'install powerline fonts'
    git clone https://github.com/powerline/fonts.git ~/.fonts
    cd ~/.fonts
    ./install.sh
  else
    echo 'powerline fonts already installed'
  fi
}

install_linux_and_mac_packages () {
  platform=$(uname);
  if [[ $platform == 'Linux' ]]; then
    download_linux_packages
  elif [[ $platform == 'Darwin' ]]; then
    download_mac_packages
    install_powerline_fonts
  fi
}

install_homebrew
install_prezto
set_zsh_as_default
install_linux_and_mac_packages
install_vundle # needs vim installed from packages above
create_symlinks
