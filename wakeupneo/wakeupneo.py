#!/usr/bin/env python

# wakeupneo.py 1.1 - "The Matrix" scene written in python
# Copyright: (C) 2012 edloaa <edloaa at googlemail dot com>
# License: GPL-3 <http://www.gnu.org/licenses/gpl-3.0.txt>

import time, os, sys, random

def slcl(n):
    time.sleep(n)
    os.system('clear')
        
msg1 = 'Wake up, Neo...\nThe Matrix has you...\nFollow the white rabbit.\n'
msg2 = 'Knock, kock, Neo.'

try:
    os.system('clear')
    print('\033[1;32m', end='')
    
    for char in msg1:
        if char == '\n':
            slcl(2)
        else:
            print(char, end='')
            sys.stdout.flush()
            time.sleep(random.uniform(0.05,0.25))
    
    print(msg2, '\033[0m', end='')
    sys.stdout.flush()
    slcl(2)
    
except KeyboardInterrupt:
    print('\033[0m')
    os.system('clear')
    sys.exit(130)
