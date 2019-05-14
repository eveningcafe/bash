#!/bin/bash

if $(curl -s --unix-socket /var/run/docker.sock "http:/v1.24/containers/haproxy/json" | jq ".State.Running"); then
   echo ok
   exit 0
else
   echo notok
   exit 1
fi
