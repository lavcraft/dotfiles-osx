#!/bin/bash

set -o pipefail -e
echo $BASH_SOURCE
CURDIR=$(dirname $BASH_SOURCE)
source $CURDIR/../.functions

pushd $CURDIR

_title 'Configure zsh and oh-my-zsh'

if [ ! -d "$HOME/.oh-my-zsh/plugins" ]; then
  _install 'oh-my-zsh cf plugin'
  pushd ~/.oh-my-zsh/plugins
  git clone https://github.com/dannyzen/cf-zsh-autocomplete-plugin.git cf
  popd #cf plugin
else
  _install 'oh-my-zsh skip install cf'
  pushd ~/.oh-my-zsh/plugins/cf
  git pull
  popd
fi

_title 'Copy oh-my-zsh themes'

for i in `ls oh-my-zsh-themes`;do
  _install "install oh-my-zsh theme - $i"
  ln -svf "$PWD/oh-my-zsh-themes/$i" "$HOME/.oh-my-zsh/custom/themes/$i"
done

popd
