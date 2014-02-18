#!/usr/bin/env python

from operator import itemgetter

import sys

# input comes from STDIN (standard input)
for line in sys.stdin:
    # split the line into words
    words = line.split(",")

    arrDelay = words[14];

    if(arrDelay!="NA" and arrDelay!="ArrDelay"):   
        print "%s\t%s" % (arrDelay, 1)

