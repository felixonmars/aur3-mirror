#!/bin/sh
#Todo menu for Openbox
#Copyright (c) 2010 Cameron Turner
#Released under a BSD license

TODO_PATH=~/.config/todo
[ -z "$XDG_CONFIG_HOME" ] || TODO_PATH="$XDG_CONFIG_HOME/todo"

[ ! -f $TODO_PATH ] && touch $TODO_PATH

if [ "$1" = "add" ]
then
  TODO=`zenity --entry --text "Enter todo:" --entry-text ""`
  [ "$TODO" = "" ] && exit
  
  TODO=`echo -n $TODO | sed -e "s/\&/\&amp;/g" -e "s/</\&lt;/g" -e "s/>/\&gt;/g"`
  echo $TODO >> $TODO_PATH
elif [ "$1" = "delete" ]
then
  TEMP=`mktemp`
  sed "$2 d" $TODO_PATH > $TEMP
  mv -f $TEMP $TODO_PATH
elif [ "$1" = "edit" ]
then
  TODO=`sed "$2 !d" < $TODO_PATH`
  TODO=`zenity --entry --text "Enter todo:" --entry-text "$TODO"`
  [ "$TODO" = "" ] && exit
  
  TEMP=`mktemp`
  TODO=`echo -n $TODO | sed -e "s/\&/\&amp;/g" -e "s/</\&lt;/g" -e "s/>/\&gt;/g"`
  sed "$2 c$TODO" $TODO_PATH > $TEMP
  mv -f $TEMP $TODO_PATH
else
  echo "<openbox_pipe_menu>"
  i=1
  while read LINE
  do
    echo "<menu id=\"todo-$i\" label=\"$LINE\">"
    echo "<item label=\"Edit\">"
    echo "<action name=\"Execute\"><execute>$0 edit $i</execute></action>"
    echo "</item>"
    echo "<item label=\"Delete\">"
    echo "<action name=\"Execute\"><execute>$0 delete $i</execute></action>"
    echo "</item>"
    echo "</menu>"
    i=$(($i+1))
  done < $TODO_PATH
  echo "<separator />"
  echo "<item label=\"Add new todo\">"
  echo "<action name=\"execute\"><execute>$0 add</execute></action>"
  echo "</item>"
  echo "</openbox_pipe_menu>"
fi