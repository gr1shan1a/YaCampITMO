#!/bin/bash

PIPE_NAME="my_pipe"

if [ ! -p "$PIPE_NAME" ]; then
  mkfifo "$PIPE_NAME"
fi

send_to_pipe() {
  echo "$1" > "$PIPE_NAME"
}

while true; do 
  read -p "Enter stringline: " input
  if [ "$input" == "QUIT" ]; then
    echo " Generator ends"
    send_to_pipe "$input"
    break
  fi
  send_to_pipe "$input"
done

rm -f "$PIPE_NAME"

