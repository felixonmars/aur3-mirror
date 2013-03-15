#!/bin/bash
# Logitech G9 mouse LED color-changing daemon (by time interval)

# Time until change
time=10m

# Colors (large group)
# colors=(000033 000066 000099 003300 006600 00CC00 00FF33 330000 330033 330066 333300 336600 33CC33 33FF00 33FF33 660000 660033 6600CC 6600FF 66FF00 66FF33 99FF00 99FF33 CC3300 CCCC00 CCFF00 CCFF33 FF0000 FF0033 FF0066 FF0099 FF3300 FF3333 FF6600 FF6633 FFFF00)
# Colors (basic, distinct: red orange yellow-grn green cyan blue purple fuscia)
colors=(ff0000 ffff00 8aff00 00ff00 00aeb0 000066 450046 ff0060)

# Random color-change at time interval
#while true; do
#  sudo g9led ${color[$((RANDOM %= $((${#color[@]}))))]}
#  sleep ${minutes}s
#done

# Ordered color-change at time interval
while true; do
  for color in ${colors[@]}; do
    sudo g9led $color
    sleep $time
  done
  continue
done &