#!/bin/bash
#########################
#--nopreview
#--ISO 100
#--exposure auto night verylong spotlight
#--awb sun cloud horizon
#--drc low medium high
#-w 1275 -h 650
#-w 640 -h 480 
#--thumb none
#--exif none
#--encoding jpg
#-p 100,100,300,200 -change preview values
########################
REMOTE_SERVER_PATH=ec2-user@52.26.112.248:/usr/local/nginx/html/corcovadoStream-html/assets/img/last.jpg
OUTPUT_PATH=/home/pi/corcovadoNow/outputs/last.jpg
while true; do 
	DATETIME=$(date +"%Y-%m-%d_%H%M")
	DATE=`date +%Y%m%d`
	HOUR=`date +%H`
	echo $DATETIME
	#Last click coordinates: 1264, 834
	if [[ $HOUR -ge 10 && $HOUR -lt 20 ]]; then
		#sudo raspistill -q 100 -rot 270 -ex auto -o /home/pi/corcovadoNow/outputs/$DATETIME.jpg
		sudo raspistill -q 75 -rot 270 --nopreview -w 1275 -h 650 --thumb none --exif none --encoding jpg -o $OUTPUT_PATH
		wait
		#sudo cp /home/pi/corcovadoNow/outputs/$DATETIME.jpg /usr/share/nginx/www/last.jpg
		scp -o StrictHostKeyChecking=no -i /home/pi/fcavalcanti.pem /home/pi/corcovadoNow/outputs/last.jpg $REMOTE_SERVER_PATH
		wait
		#sudo rm -rf /home/pi/corcovadoNow/outputs/$DATETIME.jpg
		#wait
	else
		#sudo raspistill -q 100 -rot 270 -ex night -o /home/pi/corcovadoNow/outputs/$DATETIME.jpg
		sudo raspistill -q 75 -rot 270 --drc low -ev -10 -ex verylong --awb horizon --nopreview -w 1275 -h 650 --thumb none --exif none --encoding jpg -o $OUTPUT_PATH
		wait
		#sudo cp /home/pi/corcovadoNow/outputs/$DATETIME.jpg /usr/share/nginx/www/last.jpg
		scp -o StrictHostKeyChecking=no -i /home/pi/fcavalcanti.pem /home/pi/corcovadoNow/outputs/last.jpg $REMOTE_SERVER_PATH
		wait
		#python ../twitter-master/colorCheck.py
		#sudo rm -rf /home/pi/corcovadoNow/outputs/$DATETIME.jpg
		#wait
	fi
	sleep 45
done
