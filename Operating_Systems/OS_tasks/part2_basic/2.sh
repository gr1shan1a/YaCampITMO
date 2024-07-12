#!/bin/bash

ps -o lstart= -p $! | tail -n 1 | awk '{print $1 }'
