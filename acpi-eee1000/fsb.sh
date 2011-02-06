#!/bin/bash

# ACPI script to manage power consumption by manipulating the FSB
# through the /proc/eee/fsb interface.
#
# If ENABLE_PWRMGMT=Y in /etc/acpi/eee.conf, then the third silver
# user button will be enabled to cycle through the three power management 
# settings:
#
#  Power Saving:  default PLL multiplier is 85
#  High Performance:  default PLL multiplier is 100
#  Super Performance:  default PLL multiplier is 110 (overclock)
#
# The voltage flag will be set to "1"(normal voltage)  when the AC cord 
# is plugged in; "0" (low voltage) when operating from the battery.
#
# If ENABLE_PWRMGMT=Y and ENABLE_PWRMGMT_AUTO=Y in /etc/acpi/eee.conf,
# then the following events will also trigger FSB changes:
#
#  AC POWER OFF (switch to battery):  change to power saving, low voltage
#  AC POWER ON (switch to AC power):  change to high performance, normal voltage
#  SUSPEND:  save current settings, change to power saving, low voltage
#  RESUME:  restore previous setting
#
# You can also add the "fsb" script to your DAEMONS in /etc/rc.conf, and drop the 
# "fsb" script in /etc/rc.d, to save and restore your settings upon shutdown
# and boot.
#
# Scott Prater
# October 2008

source /etc/acpi/eee.conf
source /etc/acpi/eee/user && x_user_func

#-----------------------------------------------------------------------#
# Configuration								#
#-----------------------------------------------------------------------#

# Normal voltage
NVOLT=1

# Low voltage
LVOLT=0

#### You shouldn't need to change anything below ####

# PLL divisor -- do not change!
PLLDIV=50

# Path to FSB interface
FSB="/proc/eee/fsb"

# Path to state file
statefile="/var/state/fsb/fsb"

# Path to asusosd state file
osdfile="/var/state/fsb/osd"

# Step FSB changes by this increment
step=5

#-----------------------------------------------------------------------#
# Functions								#
#-----------------------------------------------------------------------#

checkfreq () {

	# Check that we have an argument
	if [ "X$1" == "X" ]
        then
            logger "No frequency found!  Exiting."
            exit 1
        fi

	# Accept only digits
	echo $1 | grep "[^0-9]" > /dev/null 2>&1
	if [ "$?" -eq "0" ]; then
	    logger "Frequency '$1' is not an integer between 50 and 150. Exiting."
            exit
	fi

	# Check that it's within the range
	if [ $1 -lt 50 -o $1 -gt 150 ]
	then
	    logger "Frequency '$1' outside acceptable range ( 50 <= freq <= 150 ).  Exiting."
	    exit 1
	fi
}

setfreq () {
	fq=$1
        volt=$2

	checkfreq $fq

	if [ "X$volt" == "X" -o $volt -lt 0 -o $volt -gt 1 ]
	then
	     logger "Invalid voltage flag.  Exiting."
	     exit 1
	fi

	# Sleep a tenth of a second, to prevent the system from
	# flaking out when there's a big jump.  Fortunately, 
	# ArchLinux "sleep" command supports fractions of a second.

	sleep .1

	# It seems high voltage settings with low cpu speed
	# causes the system to flake out.  If the CPU is below 85,
	# set to low voltage.

	if [ $fq -lt 85 ]
	then
	     volt=$LVOLT
	fi

	logger "Setting FSB to '$fq $PLLDIV $volt'"
	echo $fq $PLLDIV $volt > $FSB
}

getfreq () {
    cat $FSB | awk {'print $1'}
}

stepup () {
	begin=$1
	end=$2
	counter=$begin

	checkfreq $begin
	checkfreq $end

	if [ $begin -gt $end ]
        then
		logger "Invalid arguments to step up: '$1 to $2'.  Exiting."
		exit 1;
	fi

	#echo "Stepping FSB up to '$end $PLLDIV $VOLTAGE' from $begin"

	while [ $counter -le $end ]
	do
	    let counter=$counter+$step

	    if [ $counter -ge $end ]
	    then
		setfreq $end $VOLTAGE
		let counter=$counter+$step
	    else
		setfreq $counter $VOLTAGE
	    fi
	done
}

stepdown () {
	begin=$1
	end=$2
	counter=$begin

	checkfreq $begin
	checkfreq $end

	if [ $begin -lt $end ]
        then
		logger "Invalid arguments to step down: '$1 to $2'.  Exiting."
		exit 1;
	fi

	#echo "Stepping FSB down to '$end $PLLDIV $VOLTAGE' from $begin"

	while [ $counter -ge $end ]
	do
	    let counter=$counter-$step
	    if [ $counter -le $end ]
	    then
		setfreq $end $VOLTAGE
		let counter=$counter-$step
	    else
		setfreq $counter $VOLTAGE
	    fi
	done
}

#-----------------------------------------------------------------------#
# Main									#
#-----------------------------------------------------------------------#

# Exit if we're not enabled
if [ "X$ENABLE_PWRMGMT" != "XY" -a "X$ENABLE_PWRMGMT" != "Xy" ]
then
	exit 0;
fi

# Exit if there's no FSB interface
if [ ! -e $FSB ]
then
	logger "$FSB doesn't exist. Exiting"
	exit 0
fi

# Set the AUTO flag
if [ "X$ENABLE_PWRMGMT_AUTO" != "XY" -a "X$ENABLE_PWRMGMT_AUTO" != "Xy" ]
then
	AUTO=0
else
	AUTO=1
fi

# Get the current setting
FREQ=`getfreq`
checkfreq $FREQ

# Get the current AC state, set voltage mode
AC_STATE=`cat /proc/acpi/ac_adapter/AC0/state|cut -c 26-`
if [ "X$AC_STATE" == "Xon-line" ]
then
	VOLTAGE=$NVOLT
else
	VOLTAGE=$LVOLT
fi

# Create the state files, set permissions
fsbdir=`dirname $statefile`
if [ ! -d $fsbdir ]
then
	mkdir -p $fsbdir || exit 1
fi

touch $statefile $osdfile || exit 1
chown $user $statefile $osdfile || exit 1

# Now do the work

case $1 in
	next )
	    if [ $FREQ -lt $HIPERF ]
	    then
		echo 0 > $osdfile
		stepup $FREQ $HIPERF
	        getfreq > $statefile || exit 1;
		echo "HIPERF" > $osdfile
	    elif [ $FREQ -lt $SPPERF ]
            then
		echo 0 > $osdfile
		stepup $FREQ $SPPERF
	        getfreq > $statefile || exit 1;
		echo "SPPERF" > $osdfile
            else
		echo 0 > $osdfile
		stepdown $FREQ $PWRSAV
	        getfreq > $statefile || exit 1;
		echo "PWRSAV" > $osdfile
            fi
	;;

	autosuspend )
	    if [ $AUTO -eq 0 ]
	    then
	        exit 0;
	    fi

	    getfreq > $statefile || exit 1;

	    VOLTAGE=$NVOLT
	    if [ $FREQ -lt $HIPERF ]
            then
		stepup $FREQ $HIPERF
            else
		stepdown $FREQ $HIPERF
	    fi
	;;

	autoresume )
	    if [ $AUTO -eq 0 ]
	    then
	        exit 0;
	    fi

	    if [ ! -e $statefile ]
            then
		logger "Cannot open '$statefile'.  Exiting."
		exit 1
            fi

	    NEWFREQ=`cat $statefile`

            checkfreq $NEWFREQ

	    if [ $FREQ -lt $NEWFREQ ]
            then
		stepup $FREQ $NEWFREQ
	        getfreq > $statefile || exit 1;
            else
		stepdown $FREQ $NEWFREQ
	        getfreq > $statefile || exit 1;
	    fi
	;;

	autoACon )
	    if [ $AUTO -eq 0 ]
	    then
	        exit 0;
	    fi

	    VOLTAGE=$NVOLT
	    if [ $FREQ -lt $HIPERF ]
            then
		stepup $FREQ $HIPERF
	        getfreq > $statefile || exit 1;
            else
		stepdown $FREQ $HIPERF
	        getfreq > $statefile || exit 1;
	    fi
        ;;

	autoACoff )
	    if [ $AUTO -eq 0 ]
	    then
	        exit 0;
	    fi

	    VOLTAGE=$LVOLT
	    if [ $FREQ -lt $PWRSAV ]
            then
		stepup $FREQ $PWRSAV
	        getfreq > $statefile || exit 1;
            else
		stepdown $FREQ $PWRSAV
	        getfreq > $statefile || exit 1;
	    fi
	;;

	save )
	    getfreq > $statefile || exit 1;
	;;

	restore )
            if [ "X$AC_STATE" == "Xoff-line" ]
            then
		NEWFREQ=$PWRSAV
	        VOLTAGE=$LVOLT
	    else
	        if [ ! -e $statefile ]
                then
		    logger "Cannot open '$statefile'.  Exiting."
		    exit 1
                fi

	        NEWFREQ=`cat $statefile`
	    fi

            checkfreq $NEWFREQ

	    if [ $FREQ -lt $NEWFREQ ]
            then
		stepup $FREQ $NEWFREQ
	        getfreq > $statefile || exit 1;
            else
		stepdown $FREQ $NEWFREQ
	        getfreq > $statefile || exit 1;
            fi
	;;

	* )
	    logger "Invalid argument to $0.  Exiting."
	    exit 1
	;;
esac
