#!/bin/bash

set -o pipefail -e
echo $BASH_SOURCE
CURDIR=$(dirname $BASH_SOURCE)
source $CURDIR/../.functions
pushd $CURDIR

_title 'Configure tmux'

_install '~/.tmux.conf'
ln -sfv "$PWD/tmux.conf" $HOME/.tmux.conf
_install '~/.scripts.tmux'
ln -sfv "$PWD/scripts.tmux" $HOME/.scripts.tmux

_install 'Configure caps-lock as prefix key by hidutil'
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000043}]}'

_install 'tmux plugins'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

popd
