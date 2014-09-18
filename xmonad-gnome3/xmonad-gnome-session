#!/bin/sh

# Nicer, less sticky pointer
unclutter -idle 1 -jitter 10 -root &
xsetroot -cursor_name 'left_ptr' &

xmonad --recompile
exec gnome-session --session=xmonad-gnome
