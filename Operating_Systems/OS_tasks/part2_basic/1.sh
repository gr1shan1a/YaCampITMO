#!/bin/bash

cat /var/log/anaconda/syslog | \
sed 's/[[:space:][:punct:]]\+/\n/g' | \
tr '[:upper:]' '[:lower:]'| \
awk '{ if (length($0) >= 4) print }' | \
awk '{
     stat[$0]++
     }
     END {
     for (var in stat)
       print var, stat[var]
     }' | \
sort -k2 -nr | head -n1 | \
awk ' {print $1 }'
