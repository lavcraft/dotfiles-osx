#!/bin/bash

set -o pipefail -e
echo $BASH_SOURCE
CURDIR=$(dirname $BASH_SOURCE)
source $CURDIR/../.functions

pushd $CURDIR

_title 'Configure tmux'

SCRIPTS=(
aliases
zshrc
scripts
keyrebinder
)

for i in ${SCRIPTS[@]};do
  _install "copy $i to ~/.$i"
  ln -sfv $PWD/$i $HOME/.$i
done

_install 'fzf completion'
curl https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh -o $HOME/.fzf.completion.zsh

_install 'fzf bindings'
curl https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh -o $HOME/.fzf.bindings.zsh

_install 'fzf-tmux'
curl https://raw.githubusercontent.com/junegunn/fzf/master/bin/fzf-tmux -o $HOME/.fzf-tmux

popd
