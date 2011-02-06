#!/usr/bin/python
# -*- coding: utf-8 -*-
# Alexander Rødseth <rodseth@gmail.com>
# BSD license
# 24032009

from sys import argv
from os import mkdir
from os import system
from os import environ
from os.path import join
from os.path import exists

def main():
    arguments = argv[1:]
    if arguments:
        where = arguments[0]
    else:
        where = join(environ['HOME'], '.tiddlywiki')
    goal = join(where, 'index.html')
    if not exists(where):
        mkdir(where)
        system('cp /usr/share/tiddlywiki/empty.html %s' % (goal))
    system('/usr/bin/xdg-open %s' % (goal))

if __name__ == "__main__":
    main()
