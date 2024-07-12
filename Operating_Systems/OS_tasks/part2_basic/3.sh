#!/bin/bash

echo "Starting phonovie processes..."
echo "=============================="

function calculation_loop() {
  while true; do
    local pid=$BASHPID
    num1=$(( RANDOM % 100 + 1 ))
    num2=$(( RANDOM % 100 + 1 ))
    result=$(( "$num1" * "$num2" ))
    echo "$(date +%T) - PID $pid   -   Result of $num1 * $num2 = $result"
    
  done
}

calculation_loop &
PID1=$!
calculation_loop &
PID2=$!
calculation_loop &
PID3=$!

echo "PID1: $PID1, PID2: $PID2, PID3: $PID3"


