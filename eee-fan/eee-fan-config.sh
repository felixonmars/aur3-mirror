#!/bin/sh
# A simple configuration gui for eee-fan-control.sh
## yet another dubious Dougal script for Puppy Linux, Oct. 22nd 2008
## Licenced under GPL v2 or later
## No BASHisms I'm aware of...
# Update Nov. 2nd: add VERBOSE_LOGGING and mention MAX_ and MIN_ temps

SCRIPT_NAME="eee-fan-ctrl.sh"
CONFIG_FILE="/etc/eee-fan.conf"
LOG_FILE="/var/log/eee-fan.log"
# a list of the variables in the config file (so we can set the defaults in the gui)
VARIABLES="CONTROL_FAN SLEEP_TIME HIGH_TEMP LOW_TEMP FAN_SPEED ENABLE_LOGGING VERBOSE_LOGGING"
# a list of the variables that get shaded if control is set to "false"...
SHADEABLES="SLEEP_TIME HIGH_TEMP LOW_TEMP FAN_SPEED ENABLE_LOGGING VERBOSE_LOGGING"

## A function to kill stray processes (sometimes remain if dialog closed by WM)
## dialog variable passed as param
clean_up_gtkdialog(){
 [ "$1" ] || return
 for I in $( ps -eo pid,command | grep "$1" | grep -v grep | grep -F 'gtkdialog3' | cut -d' ' -f1 )
 do kill $I
 done 
}

# Source config file
. $CONFIG_FILE

# set defaults for gtkdialog (and so we know if the value was changed...)
for ONE in $VARIABLES
do eval DEFAULT_$ONE=\$$ONE
done

# set the default visibility
if [ "$CONTROL_FAN" = "true" ] ; then
  for ONE in $SHADEABLES
  do eval VISIBLE_$ONE=\"\<visible\>enabled\<\/visible\>\"
  done
else
  for ONE in $SHADEABLES
  do eval VISIBLE_$ONE=\"\<visible\>disabled\<\/visible\>\"
  done
fi

# create the block of if commands for (un)shading fields
CONTROL_FAN_CODE=""
for ONE in $SHADEABLES
do
  CONTROL_FAN_CODE="$CONTROL_FAN_CODE
         <action>if false disable:$ONE</action>
         <action>if true enable:$ONE</action>"
done

export EEE_FAN_CONFIG_GUI="<window title=\"Eee Fan Control Configuration\" icon-name=\"gtk-preferences\" window-position=\"1\">
 <vbox>
   <checkbox>
     <label>\"Control the fan manually?\"</label>
     <variable>CONTROL_FAN</variable>
     <default>$DEFAULT_CONTROL_FAN</default>
     $CONTROL_FAN_CODE
   </checkbox>
   
   <hbox>
     <text>
       <label>How frequently we should check the temperature (in seconds)?</label>
     </text>
     <entry>
       <variable>SLEEP_TIME</variable>
       <default>$DEFAULT_SLEEP_TIME</default>
       $VISIBLE_SLEEP_TIME
     </entry>
   </hbox>
   
   <frame  Operating Temperature Range >
   <text use-markup=\"true\">
     <label>\"The temperature range in which the fan should be active:
When the temperature reaches the 'High temp', the fan will be activated and remain active until the temperature gets down to the 'Low temp'. (Temperatures are in centigrade/Celsius.)
<i>Note: The daemon only accepts values in the range $MIN_TEMP-$MAX_TEMP.</i>\"</label>
   </text>
   <hbox>
     <text>
       <label>High temp:</label>
     </text>
     <entry>
       <variable>HIGH_TEMP</variable>
       <default>$DEFAULT_HIGH_TEMP</default>
       $VISIBLE_HIGH_TEMP
     </entry>
   
     <text>
       <label>Low temp:</label>
     </text>
     <entry>
       <variable>LOW_TEMP</variable>
       <default>$DEFAULT_LOW_TEMP</default>
       $VISIBLE_LOW_TEMP
     </entry>
   </hbox>
   </frame>
   <hbox>
     <text>
       <label>The speed to run the fan at (0-100):</label>
     </text>
     <entry>
       <variable>FAN_SPEED</variable>
       <default>$DEFAULT_FAN_SPEED</default>
       $VISIBLE_FAN_SPEED
     </entry>
   </hbox>
   <frame  Logging support (log file $LOG_FILE) >
     <checkbox>
       <label>Enable logging? (log any status changes)</label>
       <variable>ENABLE_LOGGING</variable>
       <default>$DEFAULT_ENABLE_LOGGING</default>
       $VISIBLE_ENABLE_LOGGING
     </checkbox>
     <checkbox>
       <label>Verbose logging? (log the temperature every time we check it)</label>
       <variable>VERBOSE_LOGGING</variable>
       <default>$DEFAULT_VERBOSE_LOGGING</default>
       $VISIBLE_VERBOSE_LOGGING
     </checkbox>
   </frame>
   <checkbox>
     <label>Apply now (rather tnat next time script is started)?</label>
     <variable>APPLY_NOW</variable>
     <default>true</default>
   </checkbox>
   <hbox>
    <button ok></button>
    <button cancel></button>
  </hbox>
 </vbox>
</window>"

I=$IFS; IFS=""
for STATEMENT in  $(gtkdialog --program EEE_FAN_CONFIG_GUI); do
	eval $STATEMENT 2>/dev/null
done
IFS=$I
clean_up_gtkdialog EEE_FAN_CONFIG_GUI
unset EEE_FAN_CONFIG_GUI

case $EXIT in OK) ;; *) exit ;; esac

# see if anything has changed
for ONE in $VARIABLES
do
  eval OLD=\$DEFAULT_$ONE
  eval NEW=\$$ONE
  if [ "$NEW" != "$OLD" ] ; then
    # make sure the new value is not blank!
    [ "$NEW" ] || continue
    sed -i "s/^$ONE=.*/$ONE=$NEW/" "$CONFIG_FILE"
  fi
done

# see if we want to apply immediately
$APPLY_NOW && killall -q -HUP $SCRIPT_NAME
