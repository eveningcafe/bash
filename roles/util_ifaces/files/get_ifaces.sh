#!/bin/bash

systemctl -a | grep net-devices | egrep -v "(/sys/subsystem|Virtual Function)" | awk '{print $1}' | cut -d'-' -f5 | cut -d'.' -f1
