#!bin/bash

grep -EiIor "/<[[:alnum:]/.-_!]+@[[:alnum:]-_]+(/.[:alnum:]){1,6}" /etc/*
