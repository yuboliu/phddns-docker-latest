#!/bin/sh
orayStatus=`phddns status | grep Runstatus | awk '{print $3}'`
if [ "$orayStatus" = "ONLINE" ]; then
    exit 0
else
    exit 1
fi
