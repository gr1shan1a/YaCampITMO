#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <PID>"
  exit 1
fi

PID=$1
echo "Adjusting CPU affinity for PID $PID..."


CPU_PERCENT=$(shuf -i 10-20 -n 1)

taskset -pc 0-$CPU_PERCENT $PID

echo "CPU affinity set to use $CPU_PERCENT% of CPU for PID $PID."


