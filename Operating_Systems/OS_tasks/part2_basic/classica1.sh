#!/bin/bash

a=("2" "3" "1")
a+=("4")

shift  $a
ind=$((${#a[@]}-1))
echo "${a[ind]}"
