#!/usr/bin/python -W ignore::DeprecationWarning
from PIL import Image
from twitter import *
import random
import os

im = Image.open("../corcovadoStream/outputs/last.jpg")
pix = im.load()

consumer_key=os.environ.get('consumer_key')
consumer_secret=os.environ.get('consumer_secret')
access_token_key=os.environ.get('access_token')
access_token_secret=os.environ.get('access_token_secret')

print pix[1264, 834]

colors = pix[1264, 834]
maxDiffG = 145
maxDiffB = 145
maxDiffR = 80

defaultColor = 255

diffR = 255 - colors[0]
diffG = 255 - colors[1]
diffB = 255 - colors[2]

#de dia...cinza.
#(108, 97, 93)
#diffR=147
#diffG=158
#diffB=162

#as 7 e pouco...branco
#diffR=62
#diffG=120
#diffB=122

#orange...avermelhado
#(170, 91, 96)
#diffR=85
#diffG=164
#diffB=159

sentences = ["Check me out...I'm not white!","Check me out...I have a different color!","hummm...I think I`m different today!!!", "I'm feeling different today!!!", "Hey...I might have a strange color now..."]

if diffG >= maxDiffG and diffB >= maxDiffB and diffR >= maxDiffR:
	random.shuffle(sentences)
	print 'diffR=' + str(diffR)
	print 'diffG=' + str(diffG)
	print 'diffB=' + str(diffB)
	t = Twitter(auth=OAuth(access_token_key, access_token_secret, consumer_key, consumer_secret))
	t.statuses.update(status=str(sentences[0]))
	print 'just tweeted'