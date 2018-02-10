#!/bin/bash

set -o pipefail -e
CURDIR=$(dirname $BASH_SOURCE)
source $CURDIR/../.functions

_title 'Configure machine from scratch...'

$CURDIR/0-bootstrap.sh
$CURDIR/1-bootstrap-tools.sh
