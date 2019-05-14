#!/bin/bash

if $(nc -z -v -w5 localhost 2379 2>&1 | egrep -q "(open|succeeded)"); then
   exit 0
else
   exit 1
fi
