#!/bin/bash
while true; do 
	DATETIME=$(date +"%Y-%m-%d_%H%M")
	DATE=`date +%Y%m%d`
	HOUR=`date +%H`
	if [[ $HOUR -ge 10 && $HOUR -le 21 ]]; then
		sudo raspistill -h 700 -w 930 -q 100 -rot 270 -ex auto -o /home/pi/corcovadoStream/outputs/$DATETIME.jpg
		wait
		#sudo cp /home/pi/corcovadoStream/outputs/$DATETIME.jpg /usr/share/nginx/www/last.jpg
		scp -i /home/pi/fcavalcanti.pem /home/pi/corcovadoStream/outputs/$DATETIME.jpg ec2-user@ec2-52-26-112-248.us-west-2.compute.amazonaws.com:/usr/local/nginx/html/.
		wait
	else
		sudo raspistill -h 700 -w 930 -q 100 -rot 270 -ex night -o /home/pi/corcovadoStream/outputs/$DATETIME.jpg
		wait
		#sudo cp /home/pi/corcovadoStream/outputs/$DATETIME.jpg /usr/share/nginx/www/last.jpg
		scp -i /home/pi/fcavalcanti.pem /home/pi/corcovadoStream/outputs/$DATETIME.jpg ec2-user@ec2-52-26-112-248.us-west-2.compute.amazonaws.com:/usr/local/nginx/html/.
		wait
	fi
	sleep 90
done