import time
import picamera

with picamera.PiCamera() as camera:
    camera.start_preview()
    camera.rotation = 270
    time.sleep(2)
    for filename in camera.capture_continuous('img{counter:03d}.jpg'):
        print('Captured %s' % filename)
        #time.sleep(300) # wait 5 minutes
        time.sleep(5) # wait 5 seconds