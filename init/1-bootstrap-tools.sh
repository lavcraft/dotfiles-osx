#!/bin/bash

CURDIR=$(dirname $BASH_SOURCE)
source $CURDIR/../.functions
source ~/.sdkman/bin/sdkman-init.sh
set +e -o pipefail

_title 'Install software'

TARGET=(
  bat
  fd
  ripgrep
  openvpn
  zsh
  ansible
  tmux
  tmux-mem-cpu-load
  fzf
  coreutils
  cscope
  git
  graphviz
  imagemagick
  ranger
  tree
  vim
  wget
  httpie
  jq
  reattach-to-user-namespace
  neovim
  cloudfoundry/tap/cf-cli
  shellcheck
  ag
  nvm
  tmux-xpanes
)
for i in ${TARGET[@]};do
  _install $i
  brew install $i
  _success $i
done

TARGET=(
  iterm2
  slack
  tunnelblick
  jetbrains-toolbox
  docker-toolbox
  docker
  postman
  vlc
  visual-studio-code
  telegram
  chromium
  airflow
)
for i in ${TARGET[@]};do
  _install $i
  brew cask install $i
  _success $i
done

TARGET=(
  java
  groovy
  lazybones
  gradle
  visualvm
  groovyserv
)
for i in ${TARGET[@]};do
  _install "Install $i"
  sdk install $i < /dev/null
done

echo
_success $TARGET
echo
