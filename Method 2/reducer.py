#!/usr/bin/env python

from operator import itemgetter
import sys

current_delay = None
current_count = 0
delay = None

# input comes from STDIN
for line in sys.stdin:
 
    # parse the input we got from mapper.py
    delay, count = line.split("\t", 1)

    # convert count (currently a string) to int
    try:
        count = int(count)
    except ValueError:
        continue

    if current_delay == delay:
        current_count += count
    else:
        # write result to STDOUT
        print '%s\t%s' % (current_delay, current_count)
        current_count = count
        current_delay = delay

if current_delay == delay:
    print '%s\t%s' % (current_delay, current_count)

