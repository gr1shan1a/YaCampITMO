#!/bin/bash

ps -eo lstart,pid,cmd= | sort | tail -n 1
