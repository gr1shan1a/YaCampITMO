#!/bin/bash

grep -hEiIor "\<[[:alnum:]\.\-_\!\?]+@[[:alnum:]\-_]+(\.[[:alnum:]]+){0,6}\>" \
 /etc/* > test.txt

