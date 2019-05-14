#!/bin/bash

function get_telnet_status() {
    telnet $1 $2 </dev/null 2>&1 | grep -q Escape
}

if $(get_telnet_status localhost 3306); then
   exit 0
else
   exit 1
fi
