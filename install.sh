#!/bin/bash

VIM_BASE=${HOME}/.vim
AUTOLOAD_PATH=${VIM_BASE}/autoload
BUNDLE_PATH=${VIM_BASE}/bundle
HOST_OS=$(uname -s)

#
# get sudo permission
#
sudo echo -n

#
# install vim plug-ins
#
git submodule update --init --recursive

#
# install fzf
#
if [ -d ~/.fzf ]; then
  git -C ~/.fzf pull --rebase
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi
~/.fzf/install --all

#
# update package catalog
#
if [ "${HOST_OS}" == "Linux" ]; then
  sudo apt update
elif [ "${HOST_OS}" == "Darwin" ]; then
  brew update
fi

#
# install the silver searcher (for fzf)
#
if [ "${HOST_OS}" == "Linux" ]; then
  command -v ag --version || sudo apt --yes install silversearcher-ag
elif [ "${HOST_OS}" == "Darwin" ]; then
  command -v ag --version || brew install the_silver_searcher
fi

#
# install the ripgrep (for fzf)
#
if [ "${HOST_OS}" == "Linux" ]; then
  command -v fd --version || sudo apt --yes install ripgrep
elif [ "${HOST_OS}" == "Darwin" ]; then
  command -v fd --version || brew install ripgrep
fi

#
# initialize YCM plug-in & compile language support module
#
if [ "${HOST_OS}" == "Linux" ]; then
  command -v node --version || sudo apt --yes install nodejs
  command -v npm || sudo apt --yes install npm
  command -v mono --version || sudo apt --yes install mono-devel
elif [ "${HOST_OS}" == "Darwin" ]; then
  command -v node --version || brew install node.js
  command -v npm || brew install npm
  command -v mono --version || brew install mono
fi

#
# install rust cargo (for YCM)
#
command -v cargo > /dev/null 2>&1 || (curl https://sh.rustup.rs -sSf | sh)
pushd ${BUNDLE_PATH}/YouCompleteMe
PATH="$HOME/.cargo/bin:$PATH" ./install.py --all
popd

#
# create a symbolic link of `.vimrc` at $HOME
#
rm -f ${HOME}/.vimrc
ln -s ${VIM_BASE}/.vimrc ${HOME}/.vimrc

