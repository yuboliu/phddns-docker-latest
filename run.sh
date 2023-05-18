#!/bin/sh

phddns start
echo "sleep.....10s....."
sleep 10s
phddns version
phddns status

while :
do
    orayStatus=`phddns status | grep Runstatus | awk '{print $3}'`
        if [ "$orayStatus" != "ONLINE" ]; then
            phddns restart 
        else
        fi
    sleep 10s
done
