#!/bin/sh
#sleep 100

DATE=`date +%Y-%m-%d-%H:%M:%S`
tries=0

echo --- my_watchdog start ---
while [[ $tries -lt 5 ]]
do
    if /bin/ping -c 1 8.8.8.8 >/dev/null
    then
        echo $DATE Ping was successful.
        state=$(cat my_watchdog.txt)
        if [ ! $state ]
        then
            echo $DATE Ping was successful. >>my_watchdog.log
        elif [ $state == 0 ]
        then
            echo $DATE Ping was successful. >>my_watchdog.log
        fi
        echo --- exit ---
        echo 1 >my_watchdog.txt
        exit 0
    fi
    tries=$((tries+1))
    sleep 10
done

echo $DATE Ping had five tries and failed each time.
state=$(cat my_watchdog.txt)
if [ ! $state ]
then
    echo $DATE Ping had five tries and failed each time. >>my_watchdog.log
elif [ $state == 1 ]
then
    echo $DATE Ping had five tries and failed each time. >>my_watchdog.log
fi
echo 0 >my_watchdog.txt
