#!/bin/bash
if [ ! -n "$BASH_BOOKMARKS" ]; then export BASH_BOOKMARKS=$HOME/.bash_bookmarks; fi
if [ ! -d "$BASH_BOOKMARKS" ]; then mkdir -p $BASH_BOOKMARKS; fi

gat() {
  if test -n "$1"; then \
    cd `cat $BASH_BOOKMARKS/$1`;\
    cat $BASH_BOOKMARKS/$1;\
    else \
    for i in `find $BASH_BOOKMARKS -maxdepth 1 -type f`;\
      do echo `basename $i`;\
      done;\
  fi;
}

tag() {
  if [ ! -d $BASH_BOOKMARKS ]; then mkdir $BASH_BOOKMARKS; fi
  if [ ! -n "$1" ]; then echo -e "\\nUsage:\\n\\n  \\e[01;37mtag\\e[00m \\e[01;31m<bookmark-name>\\e[00m\\n  will bookmark your current location under name <bookmark-name>\\n"; return 0; fi
  pwd > $BASH_BOOKMARKS/$1
}
