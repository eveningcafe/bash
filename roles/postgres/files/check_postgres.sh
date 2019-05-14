#!/bin/bash

if $(nc -z -v -w5 localhost 5432 2>&1 | egrep -q "(open|succeeded)"); then
   is_slave=$(psql -hlocalhost -Upostgres -qtAX -c "select pg_is_in_recovery();")
   if [ ${is_slave} == "f" ]; then
      exit 0
   else
      exit 1
   fi
else
   exit 1
fi
