#!/bin/bash

ifconfig | grep -B1 "inet addr:{{ ansible_ssh_host }}" | awk '$1!="inet" && $1!="--" {print $1}'
