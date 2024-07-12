#!/bin/bash

FIFO_PATH="my_fifo"

if [[ ! -p $FIFO_PATH ]]; then
  mkfifo $FIFO_PATH
fi

mode="add"
result=1

function process_input() {
  local input=$1

  case $input in
   "+")
    mode="add"
   ;;
   "*")
    mode="mul"
    ;;
   "QUIT")
    echo "all stopped, result: $result"
    exit 1
    ;;
   *)
      if [[ $input =~ ^[0-9]+$ ]]; then
        if [[ $mode == "add" ]]; then
          result=$((result + input))
        elif [[ $mode == "mul" ]]; then
          result=$((result * input))
        fi
        echo "current result: $result"
      else
        echo "error with entering data. end of work"
        exit 1
      fi
      ;;
  esac
}

echo "obrabotchik zapushen. Result=$result"

while true; do
  if read -r input < $FIFO_PATH; then
    process_input "$input"
  fi
done

