#!/bin/bash
while true; do 
	DATETIME=$(date +"%Y-%m-%d_%H%M")
	DATE=`date +%Y%m%d`
	HOUR=`date +%H`
	if [[ $HOUR -ge 10 && $HOUR -le 21 ]]; then
		sudo raspistill -q 100 -rot 270 -ex auto -o /home/pi/corcovadoStream/outputs/$DATETIME.jpg
		wait
		sudo cp /home/pi/corcovadoStream/outputs/$DATETIME.jpg /usr/share/nginx/www/last.jpg
	else
		sudo raspistill -q 100 -rot 270 -ex night -o /home/pi/corcovadoStream/outputs/$DATETIME.jpg
		wait
		sudo cp /home/pi/corcovadoStream/outputs/$DATETIME.jpg /usr/share/nginx/www/last.jpg
	fi
	#sleep 3600
	sleep 5000
done