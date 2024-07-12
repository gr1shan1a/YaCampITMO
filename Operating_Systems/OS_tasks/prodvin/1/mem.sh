#!/bin/bash

cnt=1

a=()
while true; do
  a+=(1 2 3 4 5 6 7 8 9 10)
  cnt=$((cnt + 1))
  if [[ "$cnt" -eq 100000 ]]; then
    echo ${#a[@]} >> report.log
  fi
done
