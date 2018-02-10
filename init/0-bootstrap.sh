#!/bin/bash

set -o pipefail -e
CURDIR=$(dirname $BASH_SOURCE)
source $CURDIR/../.functions

_title '>>>>> Bootstrap environment'

_install 'Install homebrew'
[ -z "$(which brew)" ] &&
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
_success 'brew installed'

_install 'Install sdkman'
curl -s "https://get.sdkman.io" | bash
source ~/.sdkman/bin/sdkman-init.sh
_success 'sdk installed'

_install 'Install oh-my-zsh'
_warn 'oh-my-zsh will init new shell session. Press CTRL+D for continue'
brew install zsh && 
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
_success 'oh-my-zsh installed'

_title 'Modify .zshrc'
$CURDIR/.update_zshrc
