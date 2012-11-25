#!/bin/bash

#
# PReP_MP 4.0
#
# This silly script randomizes two set of numbers,
# One for mplayer to play an mp3 with a random faster speed,
# And Another for playing it slower.
# Lastly It Randomized wheter using the "syntax" for lower of faster
# - And then invokes mplayer, the mp3 and the speed setting with the
# Randomized Variable. :)
#
# Thanks to gam, who solved the new (real) random-file-picker-thingie'.
#
# Syntax: prep_mp [Number of times to play] [directory-path to randomize in] [normal]
# (                                i.e $1 and $2                           )
#

RANGEONE=22
FLOORONE=0

RANGETWO=99
FLOORTWO=85

RANGETHREE=4
FLOORTHREE=1

HEARDMUSIC=0

PLAYMUSIC=$1

DONUMBERONE=0

MODE=$3



if [ -z "$MODE" ]; then

MODE="unset"

fi


echo
echo -e "     <----- \033[1m PReP Mp3-Random-Play 3.0 \033[0m ----->"
echo
echo " Syntax: (prep_mp [times to play] [directory-path] [normal])"
echo
echo " Example: (prep_mp 20 /path/to/mp3s/ -- Plays 20 random files with slight different pitch)"
echo " Example: (prep_mp 5 /path/to/mp3s/ normal -- Plays 5 random files normally) "
echo


if [ $PLAYMUSIC -lt 1  ]; then
echo "No times-to-play set - See Syntax"
echo
exit
fi


##################################


while [ $HEARDMUSIC -le $PLAYMUSIC ]

do

#RANDOM=$$

numberone=0

while [ "$numberone" -le $FLOORONE ]

do
  numberone=$RANDOM
  let "numberone %= $RANGEONE"
done


#################################

while [ $DONUMBERONE -lt 1 ]

do

if [ $numberone = 10 ]; then
	numberone="1.10"
break
fi 

if [ $numberone -lt 10 ]; then
	numberone="1.0${numberone}"
break
fi 

if [ $numberone -gt 10 ]; then
	numberone="1.${numberone}"
break
fi 

echo "numberone randomization went wrong somehow: $numberone"
exit

done

#################################


#RANDOM=$$

numbertwo=0

while [ "$numbertwo" -le $FLOORTWO ]

do
  numbertwo=$RANDOM
  let "numbertwo %= $RANGETWO"
done


##################################
##################################


#RANDOM=$$

THEDO=0

while [ "$THEDO" -le $FLOORTHREE ]

do
  THEDO=$RANDOM
  let "THEDO %= $RANGETHREE"
done


###################################################################

let HEARDMUSIC=HEARDMUSIC+1

if [ $HEARDMUSIC -gt $PLAYMUSIC ]; then
exit
fi

###################################################################


(

        IFS=$'\n' # Separate by newline 
 
        files=(`find $2 -type f -iname "*"`) 
        file_count=${#files[@]} 	 
        let "selected_num=$RANDOM % $file_count" 
	 
        file=${files[$selected_num]} 
        #echo "$: $file" 



	echo
	echo -e "\E[33;40m <¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤>"
	echo
	echo -e "\E[32;40m  Playing: $HEARDMUSIC of $PLAYMUSIC times"
	echo
	echo -e "  File and mp3-pick/total: $file/$selected_num/$file_count"
	echo



	if [ $MODE = "normal" ]; then 

	echo "  Playing The Song In Normal Mode"
	echo
	echo -e "\E[33;40m -----------------------------------------------------------"
	echo
	
        mplayer -really-quiet -msgcolor -msglevel statusline=6 -vo none -ao alsa -af volume=-12 -softvol $file

        echo

 	THEDO=0

 	fi



	if [ $THEDO = 2 ]; then 

	echo "  Using a higher speed/pitch of: $numberone"
	echo
	echo -e "\E[33;40m -----------------------------------------------------------"
	echo
	echo

	mplayer -really-quiet -msgcolor -msglevel statusline=6 -vo none -ao alsa -af volume=-12 -softvol -speed $numberone $file
        
        echo
        
	fi



	if [ $THEDO = 3 ]; then 

	echo "  Using a lower speed/pitch of: 0.$numbertwo"
	echo
	echo -e "\E[33;40m -----------------------------------------------------------"
	echo
	echo

	mplayer -really-quiet -msgcolor -msglevel statusline=6 -vo none -ao alsa -af volume=-12 -softvol -speed 0.$numbertwo $file

	echo

	fi


echo ; tput sgr0

)


echo
echo ; tput sgr0

###################################################################

done

exit
