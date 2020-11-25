#!/bin/sh
#sleep 100

DATE=`date +%Y-%m-%d-%H:%M:%S`
tries=0
key=

sc_send(){
    curl -s "https://sc.ftqq.com/$key.send?text=$1"
}

echo --- my_watchdog start ---
while [[ $tries -lt 5 ]]
do
    if /bin/ping -c 1 8.8.8.8 >/dev/null
    then
        echo $DATE Ping was successful.
        state=$(cat my_watchdog.txt) >/dev/null 2>&1
        if [ ! $state ]
        then
            echo $DATE Ping was successful. >>my_watchdog.log
            sc_send 网络正常
        elif [ $state == 0 ]
        then
            echo $DATE Ping was successful. >>my_watchdog.log
            sc_send 网络恢复
        fi
        echo --- exit ---
        echo 1 >my_watchdog.txt
        exit 0
    fi
    tries=$((tries+1))
    sleep 10
done

echo $DATE Ping had five tries and failed each time.
state=$(cat my_watchdog.txt) >/dev/null 2>&1
if [ ! $state ]
then
    echo $DATE Ping had five tries and failed each time. >>my_watchdog.log
    sc_send 网络故障
elif [ $state == 1 ]
then
    echo $DATE Ping had five tries and failed each time. >>my_watchdog.log
    sc_send 网络故障
fi
echo 0 >my_watchdog.txt
