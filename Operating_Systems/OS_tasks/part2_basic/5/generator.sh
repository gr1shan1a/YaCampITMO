#!/bin/bash

HANDLER_PID=$1

echo "vvedite comandi: +, *, TERM):"

while true; do
  read -r input

  case "$input" in
    "+")
      kill -USR1 "$HANDLER_PID"
      ;;
    "*")
      kill -USR2 "$HANDLER_PID"
      ;;
    "TERM")
      kill -SIGTERM "$HANDLER_PID"
      exit 0
      ;;
    *)
       ;;
  esac
done
