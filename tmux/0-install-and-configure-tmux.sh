#!/bin/bash

set -o pipefail -e
echo $BASH_SOURCE
CURDIR=$(dirname $BASH_SOURCE)
source $CURDIR/../.functions
pushd $CURDIR

_title 'Configure tmux'
brew install caskroom/cask/karabiner-elements

_install '~/.tmux.conf'
ln -sfv "$PWD/tmux.conf" $HOME/.tmux.conf

popd
