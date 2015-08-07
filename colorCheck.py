#!/usr/bin/python -W ignore::DeprecationWarning
from PIL import Image
from twitter import *
import random

im = Image.open("../corcovadoStream/outputs/last.jpg")
pix = im.load()
#print pix[1264, 834]
colors = pix[1264, 834]
maxDiffG = 50
maxDiffB = 90
maxDiffR = 90

defaultColor = 255

diffR = 255 - colors[0]
diffG = 255 - colors[1]
diffB = 255 - colors[2]

sentences = ["Check me out...I'm not white!","Check me out...I have a different color!","hummm...I think I`m different today!!!", "I'm feeling different today!!!", "Hey...I might have a strange color now..."]

if diffG >= maxDiffG or diffB >= maxDiffB:
	random.shuffle(sentences)
	print 'diffR=' + str(diffR)
	print 'diffG=' + str(diffG)
	print 'diffB=' + str(diffB)
	t = Twitter(auth=OAuth('3406707393-MGD1EGJrXGeItx4HyQPEt0bm67Qi2ABYsYgid2t', '4MjtcETEvyFyqIKN1Twz9TOrPPwPFCnu0UhR0Gw9MeerW', 'CGqzQPkZ0kKH9mOGvixkhtny1', 'GBjCXaXMRD5c5L2rBzUYAMsiEV5ues3BIHe7rJ1SL4qCdBxX0B'))
	t.statuses.update(status=str(sentences[0]))
	print 'just tweeted'