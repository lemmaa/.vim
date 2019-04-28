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
# install the fd (for fzf)
#
if [ "${HOST_OS}" == "Linux" ]; then
  command -v fd --version || sudo apt --yes install fd
elif [ "${HOST_OS}" == "Darwin" ]; then
  command -v fd --version || brew install fd
fi

#
# install the ripgrep (for fzf)
#
if [ "${HOST_OS}" == "Linux" ]; then
  command -v rg --version || sudo apt --yes install ripgrep
elif [ "${HOST_OS}" == "Darwin" ]; then
  command -v rg --version || brew install ripgrep
fi

#
# install the fd (for fzf)
#
if [ "${HOST_OS}" == "Linux" ]; then
  command -v fd --version || sudo apt --yes install fd
elif [ "${HOST_OS}" == "Darwin" ]; then
  command -v fd --version || brew install fd
fi

#
# install node v10.x.x & yarn for coc.nvim
#
if [ "${HOST_OS}" == "Linux" ]; then
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
  sudo apt-get install -y nodejs npm
	curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
elif [ "${HOST_OS}" == "Darwin" ]; then
  command -v node --version || brew install node.js
  command -v npm || brew install npm
	command -v yarn --version || brew install yarn
fi

#
# install ccls 
#
if [ "${HOST_OS}" == "Linux" ]; then
  echo " ******Need to install ccls ******"
elif [ "${HOST_OS}" == "Darwin" ]; then
  command -v ccls --version || brew install ccls
fi

##
## initialize YCM plug-in & compile language support module
##
#if [ "${HOST_OS}" == "Linux" ]; then
#  command -v node --version || sudo apt --yes install nodejs
#  command -v npm || sudo apt --yes install npm
#  command -v mono --version || sudo apt --yes install mono-devel
#  command -v go version || sudo apt --yes install golang
#elif [ "${HOST_OS}" == "Darwin" ]; then
#  command -v node --version || brew install node.js
#  command -v npm || brew install npm
#  command -v mono --version || brew install mono
#  command -v go version || brew install golang
#fi

##
## install rust cargo (for YCM)
##
#command -v cargo > /dev/null 2>&1 || (curl https://sh.rustup.rs -sSf | sh)
#pushd ${BUNDLE_PATH}/YouCompleteMe
#PATH="$HOME/.cargo/bin:$PATH" ./install.py --all
#popd

#
# create a symbolic link of `.vimrc` at $HOME
#
rm -f ${HOME}/.vimrc
ln -s ${VIM_BASE}/.vimrc ${HOME}/.vimrc

