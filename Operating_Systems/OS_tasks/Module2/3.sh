#!/bin/bash

cat /proc/*/status | grep VmRSS | awk '{print $2, $3}' | sort -n -k2 | tail -n1


