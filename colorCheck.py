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
maxDiffG = 50
maxDiffB = 90
maxDiffR = 90

defaultColor = 255

diffR = 255 - colors[0]
diffG = 255 - colors[1]
diffB = 255 - colors[2]

#de dia
#(108, 97, 93)
#diffR=147
#diffG=158
#diffB=162

sentences = ["Check me out...I'm not white!","Check me out...I have a different color!","hummm...I think I`m different today!!!", "I'm feeling different today!!!", "Hey...I might have a strange color now..."]

if diffG >= maxDiffG or diffB >= maxDiffB:
	random.shuffle(sentences)
	print 'diffR=' + str(diffR)
	print 'diffG=' + str(diffG)
	print 'diffB=' + str(diffB)
	t = Twitter(auth=OAuth(access_token_key, access_token_secret, consumer_key, consumer_secret))
	t.statuses.update(status=str(sentences[0]))
	print 'just tweeted'