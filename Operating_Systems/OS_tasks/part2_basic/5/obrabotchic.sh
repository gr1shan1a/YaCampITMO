#!/bin/bash

value=1
usr1_handler() {
  value=$((value + 2))
}

usr2_handler() {
  value=$((value * 2))
}

sigterm_handler() {
  echo "obrabotchik ends po signaly SIGTERM"
  exit 0
}

trap 'usr1_handler' USR1
trap 'usr2_handler' USR2
trap 'sigterm_handler' SIGTERM

echo "obrabotchik zapuschen  --  PID=$$"

while true; do
  echo " current_condition: $value"
  sleep 1
done

