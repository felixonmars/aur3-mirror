#!/bin/bash
echo " ** Quake based games 'Now playing' binder for MPC by Gianfrix **"
help="Usage: $0 configfile gameexecutable"

# Check for MPC to be on $PATH
which mpc > /dev/null 
if [ "$?" -eq 1 ]
then
	echo "MPC has not been found! Probably it's not in $PATH. Quitting."
	exit
fi

# Check for config file to be specified
if [ "$1" = "" ]
then
	echo "Output config file has not been specified! Quitting."
	echo
	echo $help
	exit
else
	echo "Configuration file will be written to $1"
fi

# Check for specified game executable and check for it to be running
if [ "$2" = "" ]
then
	echo "Game executable has not been specified! Quitting."
	echo
	echo $help
	exit
else
	which $2 > /dev/null
	if [ "$?" -eq 1 ]
	then
		echo "$2 has not been found! Probably it's not in $PATH. Quitting."
		exit
	fi
fi

# All right! Now we can start the cycle!
while : ; do
	currentsong=`mpc current`
	pid=`pidof $2`
	if [ "$pid" != "" ]
	then # Game is running!
		echo
		echo "say ^8N^9ow ^8P^9laying:^8 $currentsong" > $1
		echo "Current playing song is: $currentsong"
		echo "$2 is running. Script continues running."
		mpc idle > /dev/null
	else # There's not a PID anymore, so game has been closed!
	    echo "$2 seems not running anymore. Script closes. Bye bye!"
	    exit
    fi
done
