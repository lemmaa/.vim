#!/bin/bash

VIM_BASE=${HOME}/.vim
AUTOLOAD_PATH=${VIM_BASE}/autoload
BUNDLE_PATH=${VIM_BASE}/bundle

#
# get sudo permission
#
sudo echo -n

#
# install plug-ins
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
# initialize YCM plug-in
# - compile language support module
#
HOST_OS=$(uname -s)
if [ "${HOST_OS}" == "Linux" ]; then
  sudo apt --yes install nodejs npm mono-devel
elif [ "${HOST_OS}" == "Darwin" ]; then
  brew update && brew install node.js npm mono
fi
# install rust cargo
command -v cargo > /dev/null 2>&1 || (curl https://sh.rustup.rs -sSf | sh)
pushd ${BUNDLE_PATH}/YouCompleteMe
./install.py --all
popd

#
# create a symbolic link of `.vimrc` at $HOME
#
rm -f ${HOME}/.vimrc
ln -s ${VIM_BASE}/.vimrc ${HOME}/.vimrc

