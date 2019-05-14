#!/bin/bash

docker exec {{mon_name}} ceph pg dump | awk '
BEGIN { IGNORECASE = 1 }
 /^PG_STAT/ { col=1; while($col!="UP") {col++}; col++ }
 /^[0-9a-f]+\.[0-9a-f]+/ { match($0,/^[0-9a-f]+/); pool=substr($0, RSTART, RLENGTH); poollist[pool]=0;
 up=$col; i=0; RSTART=0; RLENGTH=0; delete osds; while(match(up,/[0-9]+/)>0) { osds[++i]=substr(up,RSTART,RLENGTH); up = substr(up, RSTART+RLENGTH) }
 for(i in osds) {array[osds[i],pool]++; osdlist[osds[i]];}
}
END {
 printf("You can see current map between osd and pool now is: \n\n");
 printf("pool :  "); for (i in poollist) printf("%s   ",i); printf("| SUM \n");
 for (i in poollist) printf("--------"); printf("----------------\n");
 for (i in osdlist) { printf("osd.%i   ", i); sum=0;
   for (j in poollist) { printf("%i   ", array[i,j]); sum+=array[i,j]; sumpool[j]+=array[i,j] }; printf("| %i\n",sum) }
 for (i in poollist) printf("--------"); printf("----------------\n");
 printf("SUM :   "); for (i in poollist) printf("%s   ",sumpool[i]); printf("|\n");
}' && docker exec {{mon_name}} ceph osd lspools && docker exec {{mon_name}} ceph -s | grep health && docker exec {{mon_name}} ceph -s | grep PGs

exit 0
