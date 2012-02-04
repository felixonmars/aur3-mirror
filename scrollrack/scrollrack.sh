#!/bin/bash

scrollrack='/usr/share/java/scrollrack/scrollrack.jar'
swt='/usr/share/java/swt.jar'
smack='/usr/share/java/smack/smack.jar'
arg=-Djava.library.path=/usr/lib

cp="${scrollrack}:${swt}:${smack}"
class=net.sourceforge.scrollrack.Game
exec java $arg -cp "$cp" "$class" "$@"
