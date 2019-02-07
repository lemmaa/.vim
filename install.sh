#!/bin/bash

VIM_BASE=${HOME}/.vim
AUTOLOAD_PATH=${VIM_BASE}/autoload
BUNDLE_PATH=${VIM_BASE}/bundle

git submodule update --init --recursive

pushd ${BUNDLE_PATH}/YouCompleteMe
./install.py --all
ln -s ${VIM_BASE}/.vimrc ${HOME}/.vimrc
popd

