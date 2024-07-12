#!/bin/bash

a=("2" "3" "1")
a+=("4")

unset 'a[0]'
echo "${a[1]}"

