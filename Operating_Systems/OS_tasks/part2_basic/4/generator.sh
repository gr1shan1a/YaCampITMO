#!/bin/bash

FIFO_PATH="my_fifo"

if [[ ! -p $FIFO_PATH ]]; then
  mkfifo $FIFO_PATH
fi

echo "Generator started.."

while true; do
  read -r input 
  if [[ "$input" == "QUIT" ]]; then
    echo "$input" > $FIFO_PATH
    break
  elif [[ "$input" == "+" || "$input" == "*" || "$input" =~ ^[0-9]+$ ]]; then
    echo "$input" > $FIFO_PATH
  else
    echo "incorrect input, ending of generator"
    echo "$input" > $FIFO_PATH
    break
  fi
done
