#!/bin/bash

./mem.sh&
./mem2.sh&

mem_pid=$(pgrep -f "mem.sh")
mem2_pid=$(pgrep -f "mem2.sh")

> top_output.log

i=0

while ps -p $mem_pid > /dev/null || ps -p $mem2_pid > /dev/null; do
  top -b -n 1 -d 10 | head -n 11 >> top_output.log
  ((i++))
  if [ $i -eq 100 ]; then
    break
  fi
  sleep 10
done

dmesg | grep "mem[2]*.bash" > dmesg.log

> report_tail.log
> report_tail2.log
> itog.log
tail -n 10 report.log > report_tail.log
tail -n 10 report2.log > report2_tail.log
cat report_tail.log >> itog.log

cat report2_tail.log >> itog.log

cat top_output.log >> itog.log
cat dmesg.log >> itog.log

dmesg | grep "mem[2]*.sh"
