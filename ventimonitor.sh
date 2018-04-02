#!/bin/bash

#Start ebUSd
sudo chmod +x datapusher.sh
sudo chmod +x datagrabber-ubbink.sh
ebusdcmd="sudo ebusd -f --scanconfig"
sudo killall ebusd
service influxdb restart
$ebusdcmd &
sudo touch /etc/ebusd/tmpdata.txt
> /etc/ebusd/tmpdata.txt
sleep 30

COUNTER=1

while [ 1 ]
do
	./datagrabber-ubbink.sh
	sleep 10
	COUNTER=$[$COUNTER +1]
	if [ $COUNTER -eq 6 ]
	then
		./datapusher.sh
		COUNTER=1
	fi
done
