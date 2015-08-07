#!/bin/bash
while true; do 
	DATETIME=$(date +"%Y-%m-%d_%H%M")
	DATE=`date +%Y%m%d`
	HOUR=`date +%H`
	#Last click coordinates: 1264, 834
	if [[ $HOUR -ge 10 && $HOUR -le 21 ]]; then
		#sudo raspistill -q 100 -rot 270 -ex auto -o /home/pi/corcovadoStream/outputs/$DATETIME.jpg
		sudo raspistill -q 100 -rot 270 -ex auto -o /home/pi/corcovadoStream/outputs/last.jpg
		wait
		#sudo cp /home/pi/corcovadoStream/outputs/$DATETIME.jpg /usr/share/nginx/www/last.jpg
		scp -o StrictHostKeyChecking=no -i /home/pi/fcavalcanti.pem /home/pi/corcovadoStream/outputs/last.jpg ec2-user@52.26.112.248:/usr/local/nginx/html/corcovadoStream-html/assets/img/last.jpg
		wait
		python ../twitter-master/colorCheck.py
		#sudo rm -rf /home/pi/corcovadoStream/outputs/$DATETIME.jpg
		#wait
	else
		#sudo raspistill -q 100 -rot 270 -ex night -o /home/pi/corcovadoStream/outputs/$DATETIME.jpg
		sudo raspistill -q 100 -rot 270 -ex night -o /home/pi/corcovadoStream/outputs/last.jpg
		wait
		#sudo cp /home/pi/corcovadoStream/outputs/$DATETIME.jpg /usr/share/nginx/www/last.jpg
		scp -o StrictHostKeyChecking=no -i /home/pi/fcavalcanti.pem /home/pi/corcovadoStream/outputs/last.jpg ec2-user@52.26.112.248:/usr/local/nginx/html/corcovadoStream-html/assets/img/last.jpg
		wait
		python ../twitter-master/colorCheck.py
		#sudo rm -rf /home/pi/corcovadoStream/outputs/$DATETIME.jpg
		#wait
	fi
	sleep 45
done