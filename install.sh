#!/bin/bash

VIM_BASE=${HOME}/.vim
AUTOLOAD_PATH=${VIM_BASE}/autoload
BUNDLE_PATH=${VIM_BASE}/bundle

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
pushd ${BUNDLE_PATH}/YouCompleteMe
./install.py --all
popd

#
# create a symbolic link of `.vimrc` at $HOME
#
ln -s ${VIM_BASE}/.vimrc ${HOME}/.vimrc

