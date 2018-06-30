#!/bin/bash

files="zpreztorc gitconfig gitignore tmux.conf agignore pryrc ctags zshenv macos" # list of files/folders to symlink in homedir
packages_mac="tmux zsh the_silver_searcher fzf hub ctags" # packages for mac
packages_linux="tmux zsh pick silversearcher-ag" # packages for linux

# create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
create_symlinks () {
  echo 'creating symlinks'
  for file in $files; do
    echo 'attempting to link' $file
    ln -s ~/dotfiles/$file ~/.$file
  done

  echo 'attempting to link init.vim'
  mkdir -p  ~/.config/nvim/
  ln -s ~/dotfiles/init.vim ~/.config/nvim
}

install_neovim () {
  brew install neovim
  pip3 install neovim
}

install_homebrew () {
  if which brew &> /dev/null; then
    echo 'brew already installed'
  else
    echo 'installing homebrew'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

install_plug () {
  echo 'cloning plug'
  mkdir ~/.vim/bundle
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
  if [[ $(echo $SHELL) == '/bin/zsh' ]]; then
    echo 'making zsh the default'
    chsh -s /bin/zsh
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
    install_homebrew
    download_mac_packages
    install_powerline_fonts
  fi
}

change_screenshot_directory () {
  mkdir ~/Screenshots
  defaults write com.apple.screencapture location ~/Screenshots
  killall SystemUIServer
}

install_prezto
set_zsh_as_default
install_linux_and_mac_packages
install_plug # needs vim installed from packages above
create_symlinks
change_screenshot_directory
