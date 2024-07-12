#!/bin/bash

PIPE_NAME="my_pipe"

if [ ! -p "$PIPE_NAME" ]; then
  echo "error.. imenovanii kanal $PIPE_NAME not found."
  exit 1
fi

mode="addition"
result=1

process_input() {
  input="$1"

  case "$input" in
    "+")
      mode="addition"
      echo "rezhim ustanovlen addition"
      ;;
    "*")
      mode="multipl"
      echo "rezhim ustanovlen multiply"
      ;;
    [0-9]*)
      if [ "$mode" == "addition" ]; then
	result=$((result + input))
	echo "result add: $result"
      elif [ "$mode" == "multipl" ]; then
	result=$((result * input))
	echo "result mul: $result"
      fi
      ;;
    "QUIT")
      echo "END exit 0"
      exit 0
      ;;
    *)
      echo "Error: not correct data: $input"
      exit 1
      ;;
  esac
}

while read -r line < "PIPE_NAME"; do
  process_input "$line"
done

rm -f "$PIPE_NAME"

