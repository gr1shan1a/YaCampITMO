#!/bin/bash

for pid in $(ps -e --no-headers -o pid); do
  if [ -e "/proc/$pid/status" ] && [ -e "/proc/$pid/sched" ]; then
    ppid=$(awk '/PPid:/ {print $2}' "/proc/$pid/sched")
   # echo $ppid

    sum_exec_runtime=$(awk '/sum_exec_runtime:/ {print $2}' "/proc/$pid/sched")

    nr_switches=$(awk '/nr_switches:/ {print $2}' "/proc/$pid/sched")
    if [ -n "$sum_exec_runtime" ] && [ -n "nr_switches" ]; then
      average_running_time=$("$sum_exec_runtime" / "$nr_switches")
      echo "Pid=$pid : PPid=$ppid : avr_running_time=$average_running_time"
fi
fi

done

