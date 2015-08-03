#!/bin/bash
# /etc/init.d/autoCam

### BEGIN INIT INFO
### END INIT INFO


case "$1" in 
    start)
        echo "Starting autoCam"
        while true; do 
			DATETIME=$(date +"%Y-%m-%d_%H%M")
			DATE=`date +%Y%m%d`
			HOUR=`date +%H`
			if [[ $HOUR -ge 10 && $HOUR -le 21 ]]; then
				raspistill -q 100 -rot 270 -ex auto -o $DATETIME.jpg
			else
				raspistill -q 100 -rot 270 -ex night -o $DATETIME.jpg
			fi
			sleep 3600
		done

        ;;
    stop)
        echo "Stopping autoCam"
        killall raspistill
        ;;
    *)
        echo "Usage: /etc/init.d/autoCam start|stop"
        exit 1
        ;;
esac

exit 0