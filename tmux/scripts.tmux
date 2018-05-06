#!/bin/bash

tns() {
  if [ -z $1 ];then
    echo "\tusage: tns NEW_SESSION_NAME"
    return 1
  fi

  session_name=$1
  tmux new-session -d -s $session_name
  tmux switch-client -t "$session_name"
}

tks() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --height 40% --reverse --query="$1" --select-1 --exit-0) &&
  tmux kill-session -t "$session"
}
