#!/bin/bash

set -o pipefail -e
CURDIR=$(dirname $BASH_SOURCE)
source $CURDIR/../.functions

_title 'Configure machine from scratch...'

$CURDIR/init/0-bootstrap.sh
$CURDIR/init/1-bootstrap-tools.sh
$CURDIR/tmux/0-install-and-configure-tmux.sh
