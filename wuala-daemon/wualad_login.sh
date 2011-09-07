#!/bin/bash

# First just start wuala in trading mode only, and then login
# to prevent the login name and password to be visible in 'ps -ef'
~/wuala/wuala -nogui &
sleep 10
~/wuala/wuala -nogui login WualaLoginName WualaPassword &
