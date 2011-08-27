#!/bin/bash
#
# $Id: mplayer.sh,v 1.41.2.7 2007/02/11 15:33:29 juri Exp $
#

unset LANG
declare VERSION="0.8.7"

# History (as always in the source code :-)
# 0.8.7 - added 544x480 as valid NTSC resolution (thanks to C.Y.M)
#	- removed 688x576 from the valid PAL resolutions;
#	- calculate USE_SPEED with 30 fps instead of 29.97
#	- use '-vf' and '-af' instead of '-vop' and '-aop', as the
#	  latter are deprecated
#
# 0.8.6 - fixed a copy'n'paste bug regarding the subtitle background 
#	  alpha color (thanks to Christian Haider)
#	- changed the fps values from rational values to integer ones
#	- fixed a typo setting DETC (thanks to Soeren Sonnenburg)
#	- disabled the use of -forceidx for RealVideos, because since
#	  mplayer-1.0pre5 it isn't necessary anymore
#
# 0.8.5 - changed the check for the existence of the video file to check also
#	  that it can actually be read
#	- added a new PAL height: 544
#	- [experimental] use detelicining (detc) filter to play NTSC as PAL;
#	  thanks to Martin Hoffmann for this one
#	- [experimental] make the detelecinig filter configurable via conf-file
#	- changed the warning messages about wrong DVD options to be displayed
#	  only when DEBUG is set to true
#	- added a comment to mplayer.sh.conf that the DVD dummy files MUST be
#	  named DVD/VCD in capital letters
#	- removed '-afm 9' from AO defaults, because audio filters by numbers are
#	  removed from MPlayer (9 meant hwac, it is handeled differently anyway)
#	- changed the the use of the -speed parameter: the man pages says one
#	  should use a value between 0.01 and 100, not something like 25:24
#
# 0.8.4 - added some more debugging info
#	- changed the MPlayer option that is used to play DVDs and VCDs from
#	  -vcd/-dvd to VCD:// and DVD://
#	- added cuefile support for MPlayer version 1.0x
#	- added new config option to distinguish MPlayer versions (0.9x or 1.0)
#	  important for playing cuefiles
#	- fixed bug in detecting empty CACHE option
#	- fixed a bug where USE_SPEED is ignored and '-speed' always used
#	- added a check for the return value of 'mplayer -identify'
#	- added support for AC3 sound when playing a DVD
#	- make audio output configurable via config file (e.g. for DXR3)
#
# 0.8.3 - changed the default value of USERDEF from '-really-quiet' to '-quiet',
#	  because it suppressed the progressbar messages from mplayer
#	- added '-dvd 1' to the DVD call to reliably play a DVD
#	  (though only the first one)
#
# 0.8.2 - changed the way mplayer is called to identify files;
#	  should prevent the opening of a X window, that happens
#	  on some systems
#	- play mpeg files without any scaling if possible
#	- added config line for AC3 out via DVB card (thanks to Christian Jacobsen)
#	- added a new config option to choose the video out device;
#	  intended for dx3 users
#	- added config options for subtitles (thanks to Martin Åkerström)
#	- fixed a bug when SLOW_CPU is set to "false" instead of being
#	  just commented out
#	- minor code clean-up
#	- cleanup some comments and messages
#
# 0.8.1 - fixed a bug when DVDFiles or DVD not set correctly
#	- if path to mplayer is incorrect, log an error and exit
#	- cue file support; you can now choose a cue file as input;
#	  after I did this on user request, I asked myself, for what
#	  do one needs this, as mplayer can play .bin files directly...
#	- support for 16/9 TV sets (thanks to Vaclav Janecek)
#
# 0.8.0 - bumped the version number to be more flexible
#       - added VCD/DVD support
#
# 0.0.7 - clear LANG variable
#       - added support for slow computers: reduces the Y
#         resolution to the half of the possible maximum
#       - use kind of a window for detecting the frames_per_sec
#
# 0.0.6a-jha
#	- fixed a bug that prevented the SLAVE mode from working
#
# 0.0.6-jha
#	- major rework
#	- added config option to disable either NTSC or PAL support
#	- added mplayer's '-speed' option; is disabled by default (see
#	  config file), because it didn't work as expected for me
#	- rudimentary sub titles support:
#	  if a sub titles file (.sub suffix) with exactly the
#	  same name as the played video file exists, it is used
#	  (not really useful yet)
#	- changed the was the config file is parsed:
#	  let's do it the simple way, just source the file
# =================================================
# --->  IMPORTANT! you MUST use the new config file
# =================================================
#
# 0.0.5d-jha
#       - added AC3 support (thanks to Christian Jacobsen
#         <christian.jacobsen -at- stageholding.de>)
#       - better support for mplayers SLAVE mode
#       - fixed some scaling problems
#       - some minor clean-ups
#
# 0.0.5c-jha
#       - play videos with 24 or 23.976 fps as NTSC, not PAL
#
# 0.0.5b-jha
#       - Improved getvidxy - thanks to new mplayer option '-identify'
#         it gets now the correct values for X-/Y-resolution
#         and the framerate (if defined in the video file)
#         for all media files
#       - reworked the scaling calculation to scale only if needed
#         and if so, scale as little as possible to save CPU power
#       - distinguish between NTSC and PAL files; play them with
#         the right TV norm
#
# 0.0.4	Improved getvidxy - No Temp Files needed anymore!
#
# 0.0.3	Seems to work fine - still lacks support for X x 432 Files
#	What about MPEG Files ? 
#


function initialize () {
  # source config file
  source "$CFGFIL"

  # Debug Mode ?
  if test -z "$DEBUG" -o "$DEBUG" != "true"; then DEBUG=false; fi

  # use AC3?
  if test -z "$USEAC3" -o "$USEAC3" != "true"; then USEAC3=false; fi
  debugvar USEAC3 "$USEAC3"

  # AC3 command line
  if test -z "$AC3AOUT"; then
    errorcfg AC3AOUT
    exit
  else
    debugvar AC3AOUT "$AC3AOUT"
  fi

  # TV aspect ratio
  if test -z "$TV_ASPECT"; then errorcfg TV_ASPECT; fi
  debugvar TV_ASPECT "$TV_ASPECT"

  # can do PAL?
  if test -z "$PAL" -o "$PAL" != "true"; then PAL=false; fi
  debugvar PAL "$PAL"

  # can do NTSC?
  if test -z "$NTSC" -o "$NTSC" != "true"; then NTSC=false; fi
  debugvar NTSC "$NTSC"

  if test $NTSC == "false" -a $PAL == "false"; then
    echolog "*** FATAL: Config Options NTSC and PAL both set to false ... Exiting."
    exit
  fi

  # use speed setting?
  SPEED=""
  if test -z "$USE_SPEED"; then USE_SPEED=false; fi
  debugvar USE_SPEED "$USE_SPEED"

  # which detelecining filter should be used, if configured
  # to play NTSC as PAL
  if test -z "$DETC_FILTER"; then DETC_FILTER="detc=dr=2:am=1"; fi
  debugvar DETC_FILTER "$DETC_FILTER"

  # where is Mplayer
  if ! test -x "$MPLAYER" -a -f "$MPLAYER"; then
    echolog "*** Option MPLAYER not found in config file or not set correctly"
    exit
  else
    debugvar MPLAYER "$MPLAYER"
  fi

  if test -z "$VOP"; then errorcfg VOP; exit; else debugvar VOP "$VOP"; fi

  if test -z "$VO"; then errorcfg VO; exit; else debugvar VO "$VO"; fi

  if test -z "$AO"; then errorcfg AO; exit; else debugvar AO "$AO"; fi
  AOUT="-ao $AO"

  if test -z $CACHE; then
    echolog "*** Option CACHE not set in config file - calling mplayer without Cache!"
    CACHESTR="-nocache"
  else
    CACHESTR="-cache $CACHE"; debugvar CACHE "$CACHE"; debugvar CACHESTR "$CACHESTR"
  fi

  if test -z "$FRAMEDROP" -o "$FRAMEDROP" != "true"; then FRAMEDROP=false; fi
  debugvar FRAMEDROP "$FRAMEDROP"
  if $FRAMEDROP; then FDSTR="-framedrop"; fi 
  debugvar FDSTR "$FDSTR"

  declare LIRCSTR="" # no extra Lirc option!
  if ! test -z "$LIRCRC"; then LIRCSTR="-lircconf $LIRCRC"; fi
  debugvar LIRCRC "$LIRCRC"; debugvar LIRCSTR "$LIRCSTR"

  if ! test -z "$SUBPOS"; then SUBTITLES=" -subpos $SUBPOS"; fi
  if ! test -z "$SUBCOLOR"; then SUBTITLES="$SUBTITLES -sub-bg-color $SUBCOLOR"; fi
  if ! test -z "$SUBALPHA"; then SUBTITLES="$SUBTITLES -sub-bg-alpha $SUBALPHA"; fi

  debugvar SUBTITLE "$SUBTITLES"

  if test "$SLAVE" != "SLAVE"; then
    REMOTE="$LIRCSTR"
  else
    REMOTE="-slave -nolirc"
  fi
  debugvar REMOTE "$REMOTE"

  if ! test -z "$USERDEF"; then echolog "*** Use Option USERDEF at your own risk!"; fi
  debugvar USERDEF "$USERDEF"

  if test -z $XResPAL; then errorcfg XResPAL; exit; else debugvar XResPAL "${XResPAL[*]}"; fi
  if test -z $XResNTSC; then errorcfg XResNTSC; exit; else debugvar XResNTSC "${XResNTSC[*]}"; fi

  # do we run on a slow computer?
  if test -z "$SLOW_CPU" -o "$SLOW_CPU" == "false"; then
    SLOW_CPU=false
  else
    XResPAL=(352)
    XResNTSC=(352)
    debugvar XResPAL "${XResPAL[*]}"
    debugvar XResNTSC "${XResNTSC[*]}"
  fi
  debugvar SLOW_CPU "$SLOW_CPU"

  if ! test -d "$DVDFiles"; then debugmsg "*** Option DVDFiles not set correctly! You will not be able to play VCD/DVD" ""; DVDFiles=""; fi
  debugvar DVDFiles "$DVDFiles"
  if ! test -b "$DVD"; then debugmsg "*** Option DVD not set correctly! You will not be able to play VCD/DVD" ""; DVD=""; fi
  debugvar DVD "$DVD"
  if test -z $DVDLANG; then DVDLANG="en"; fi
  debugvar DVDLANG "$DVDLANG"

  # extra DVD options
  debugvar DVDOPTIONS "$DVDOPTIONS"

  # extra VCD options
  debugvar VCDOPTIONS "$VCDOPTIONS"

  # play MPEG files without rescaling?
  if test -z "$MPEG_DIRECT" -o "$MPEG_DIRECT" != "false"; then MPEG_DIRECT="true"; fi
  debugvar MPEG_DIRECT "$MPEG_DIRECT"

  # get the file extension of the video
  SUFFIX=$(echo -e "${FILE:$[${#FILE}-4]:4}" | tr [A-Z] [a-z])
  debugvar SUFFIX $SUFFIX

  if test -z "$MPLAYER_V1"; then
      echolog "*** MPLAYER_V1 not set! Setting it to 'false'."
      echolog "*** If you cannot play cue-files, then set it to 'true'."
      MPLAYER_V1="false"
  fi
  debugvar MPLAYER_V1 "$MPLAYER_V1"

  return;
}


function getvidxy () {

  # call: getvidxy
  # determine x and y resolution of the file! 
  # output: variable ORIG_X and ORIG_Y (global)

  # variable definitions
  local TEMP1 MPLAYER_RETURN
  ORIG_X=0; ORIG_Y=0

  TEMP1=`$MPLAYER -identify -vo null -ao null -frames 0 "$FILE" 2>/dev/null | grep -i -e "^ID_"`
  MPLAYER_RETURN=$?
  debugmsg "OutputFromMPLAYER:" "$TEMP1"
  debugmsg "MPLAYER_RETURN: " "$MPLAYER_RETURN"

  if test $MPLAYER_RETURN -ne 0; then
     echolog "*** FATAL: something went wrong analyzing the video; mplayer reported an error!" 
     echolog "*** FATAL: check your mplayer installation. Exiting..." 
     exit
  fi

  ORIG_X=`echo "$TEMP1"|grep ID_VIDEO_WIDTH|cut -d"=" -f2`
  debugmsg "parsed output for ORIG_X:" $ORIG_X

  ORIG_Y=`echo "$TEMP1"|grep ID_VIDEO_HEIGHT|cut -d"=" -f2`
  debugmsg "parsed output for ORIG_Y:" $ORIG_Y

  ORIG_FPS=`echo "$TEMP1"|grep ID_VIDEO_FPS|cut -d"=" -f2`
  debugmsg "parsed output for ORIG_FPS:" $ORIG_FPS

  ORIG_ASPECT=`echo "$TEMP1"|grep ID_VIDEO_ASPECT|cut -d"=" -f2`
  debugmsg "parsed output for ORIG_ASPECT:" $ORIG_ASPECT

  VIDEO_FORMAT=`echo "$TEMP1"|grep ID_VIDEO_FORMAT|cut -d"=" -f2`
  debugmsg "parsed output for VIDEO_FORMAT:" $VIDEO_FORMAT

  AUDIO_CODEC=`echo "$TEMP1"|grep ID_AUDIO_CODEC|cut -d"=" -f2`
  debugmsg "parsed output for AUDIO_CODEC:" $AUDIO_CODEC

  return;
}


function calcnewxy () {
  local -i MAX_X TEMP_ASPECT
#  TEMP_ASPECT=`echo $ORIG_ASPECT|sed 's/\.//'`
#  if test $TEMP_ASPECT -eq 0; then TEMP_ASPECT=$((4000/3)); fi

  if test $ORIG_X -gt 352 -o $ORIG_Y -gt $HALF_Y; then
    MAX_X=$(($FULL_Y*$TV_ASPECT))
  else
    MAX_X=$(($HALF_Y*$TV_ASPECT))
  fi
  debugvar MAX_X $MAX_X

  NEW_Y=$(($MAX_X*$ORIG_Y/$ORIG_X)); debugvar NEW_Y $NEW_Y
  echolog "*** INFO: For Sqare Pixels we would scale to $MAX_X x $NEW_Y ..."
  test $NEW_Y -gt $FULL_Y && NEW_Y=$FULL_Y 	# force full screen/ ignore aspect ratio!

  return;
}


function choosebestx () {
  local -i MAX_X INDEX
  local XResTEMP
  declare repeat=true
  INDEX=0

  if $SLOW_CPU; then
    XResTEMP=(352)
  else
    if test $HALF_Y -eq 240; then
      XResTEMP=(${XResNTSC[*]})
    else
      if test $HALF_Y -eq 288; then
        XResTEMP=(${XResPAL[*]})
      else
	echolog "*** FATAL: HALF_Y not set or unknown: \"$HALF_Y\" ... Exiting."
	exit
      fi
    fi
  fi
  debugvar XResTEMP "${XResTEMP[*]}"

  ANZAHL=${#XResTEMP[*]}
  debugvar AnzahlVonXResTEMP $ANZAHL

  until ! $repeat; do
    if test ${XResTEMP[$INDEX]} -ge $ORIG_X; then repeat=false; NEW_X=${XResTEMP[$INDEX]}; fi
    INDEX=$(($INDEX+1))
    if test $INDEX -ge $ANZAHL; then repeat=false; NEW_X=${XResTEMP[$ANZAHL-1]}; fi
  done
  debugvar NEW_X $NEW_X

  return;
}


function choosebesty () {
  if test \( $ORIG_Y -eq $HALF_Y -a $ORIG_X -eq 352 \) -o \( $ORIG_Y -eq $FULL_Y -a ! $SLOW_CPU \); then
    REAL_Y=$ORIG_Y
    NEW_Y=$ORIG_Y
    NEW_X=$ORIG_X
    debugmsg "setting NEW = ORIG"
  else
    if test $ORIG_X -gt 352 -o $ORIG_Y -gt $HALF_Y; then
      REAL_Y=$FULL_Y
      debugmsg "setting REAL_Y = FULL_Y"
    else
      REAL_Y=$HALF_Y
      debugmsg "setting REAL_Y = HALF_Y"
    fi
  fi
  return;
}


function set_ntsc () {
  HALF_Y=240
  if $SLOW_CPU; then
    FULL_Y=$HALF_Y
  else
    FULL_Y=480
  fi
  NEW_FPS="30"
  return;
}


function set_pal () {
  HALF_Y=288
  if $SLOW_CPU; then
    FULL_Y=$HALF_Y
  else
    FULL_Y=576
  fi
  NEW_FPS="25"
  return;
}


function checkforac3 () {
  if test "X$AUDIO_CODEC" == "Xa52" && $USEAC3; then AOUT="$AC3AOUT"; fi
  return; 
}


function checktvnorm () {
local -i TEMP_FPS
TEMP_FPS=`echo $ORIG_FPS|sed 's/\.//'`
  if test $TEMP_FPS -ge "23000" -a $TEMP_FPS -le "24499"; then
    debugmsg "Film"
    if $NTSC; then
      set_ntsc
    else
      set_pal
      $USE_SPEED && SPEED="-speed 1.04" # 25/24 = 1.04
    fi
  else
    if test \( $TEMP_FPS -ge "14000" -a $TEMP_FPS -le "16000" \) -o \( $TEMP_FPS -ge "29000" -a $TEMP_FPS -le "30499" \); then
      debugmsg "NTSC"
      if $NTSC; then
        set_ntsc
      else
        set_pal
        if $USE_SPEED; then
	  SPEED="-speed 1.04" # 25/24 = 1.04
	  DETC=",$DETC_FILTER"
	fi
      fi
    else
      debugmsg "PAL or unknown" $ORIG_FPS
      if $PAL; then
        set_pal
      else
        set_ntsc
	$USE_SPEED && SPEED="-speed 1.20" # 30/25 = 1.20
      fi
    fi
  fi
  return;
}


function echolog () {
  # prints the string on stdout and into /var/log/messages using logger!
  logger -s -- "$1"
  return;
}


function errorcfg () {
  echolog "*** FATAL: Config Option $1 not found in config file ... Exiting."
  exit;
}


function debugvar () {
  if $DEBUG; then echolog "*** DEBUG: Variable $1 has value \"$2\""; fi
  return;
}


function debugmsg () {
  if $DEBUG; then echolog "*** DEBUG: $1 \"$2\""; fi
  return;
}


# begin main!
#
#
# ---------------------------------------------------------------------------
#
#

declare -i ORIG_X ORIG_Y
declare -i NEW_X NEW_Y
declare -i HALF_Y FULL_Y
declare ORIG_FPS NEW_FPS ORIG_ASPECT VIDEO_FORMAT AUDIO_CODEC
declare CMDLINE AOUT REMOTE USERDEF SUFFIX
declare FILE="$1"
declare SLAVE="$2"
declare -a XResPAL[0]
declare -a XResNTSC[0]
declare FDSTR=""
declare SUBTITLES=""
declare DETC=""

echolog "*** Starting mplayer.sh Version $VERSION"

if test -z "$FILE"; then echolog "*** USAGE: mplayer.sh <File_to_be_played>"; exit; fi
if ! test -r "$FILE"; then echolog "*** ERROR: Make sure $FILE exists and is readable - otherwise it cannot be played ;-)"; exit; fi

# Check if config file exists!
declare CFGFIL="/etc/vdr/plugins/mplayer/mplayer.sh.conf"
debugvar CFGFIL $CFGFIL
if ! test -f $CFGFIL; then echolog "*** FATAL: mplayer.sh.conf not found!!! Exiting." ; exit; fi

# read config file and initialize the variables
initialize


if test \( "$FILE" == "$DVDFiles/DVD" -o "$FILE" == "$DVDFiles/VCD" \) -a -n "$DVDFiles" -a -n "$DVD"; then
    if test "$FILE" == "$DVDFiles/DVD"; then
    	$USEAC3 && AOUT="$AC3AOUT"
        CMDLINE="$MPLAYER -vo $VO $AOUT -alang $DVDLANG $DVDOPTIONS $FDSTR $CACHESTR $REMOTE $USERDEF -dvd-device $DVD dvd://"
    fi
    if test "$FILE" == "$DVDFiles/VCD"; then
        CMDLINE="$MPLAYER -vo $VO $AOUT $VCDOPTIONS $FDSTR $CACHESTR $REMOTE $USERDEF -cdrom-device $DVD vcd://"
    fi
    unset FILE
elif test "${SUFFIX}" == ".cue"; then
    if $MPLAYER_V1; then      
        CMDLINE="$MPLAYER -vo $VO $AOUT $FDSTR $CACHESTR $REMOTE $USERDEF cue://$FILE:2"
	unset FILE
    else
        CMDLINE="$MPLAYER -vo $VO $AOUT $FDSTR $CACHESTR $REMOTE $USERDEF -vcd 2 -cuefile"
    fi
else
    # Try to determine the video attributes
    if $DEBUG; then echolog "*** DEBUG: Calling getvidxy function to analyze source video stream ..."; fi
    getvidxy
    echolog "*** INFO: Source Video has Resolution of $ORIG_X x $ORIG_Y ..."
    if test $ORIG_X -eq 0 -o $ORIG_Y -eq 0; then echolog "*** FATAL: something went wrong analyzing the video; check your mplayer version ..."; exit; fi

    NEW_FPS=$ORIG_FPS

#    if `echo "$VIDEO_FORMAT"| egrep -q "RV??"`; then
#      FORCEIDX="-forceidx"
#    else
#      FORCEIDX=""
#    fi

    checkforac3
    checktvnorm
    calcnewxy
    choosebestx
    choosebesty
    if test $NEW_X -eq 0 -o $NEW_Y -eq 0; then echolog "*** FATAL: Illegal Resolution ..."; exit; fi

    if test $MPEG_DIRECT == "true" -a \( $VIDEO_FORMAT == "0x10000001" -o $VIDEO_FORMAT == "0x10000002" \) -a \( \
             \( $PAL  -a $NEW_FPS == "25" -a \( \( $ORIG_X == "352" -a $ORIG_Y == "288" \) -o \( $ORIG_Y == "576" -a \
             \( $ORIG_X == "352" -o $ORIG_X == "480" -o $ORIG_X == "528" -o $ORIG_X == "544" -o $ORIG_X == "704" -o $ORIG_X == "720" \) \) \) \) -o \
             \( $NTSC -a $NEW_FPS == "30" -a \( \( $ORIG_X == "352" -a $ORIG_Y == "240" \) -o \( $ORIG_Y == "480" -a \
             \( $ORIG_X == "352" -o $ORIG_X == "480" -o $ORIG_X == "512" -o $ORIG_X == "544" -o $ORIG_X == "640" -o $ORIG_X == "704" -o $ORIG_X == "720" \) \) \) \) \
       \) ; then
      CMDLINE="$MPLAYER -vo $VO $AOUT $FDSTR $CACHESTR $REMOTE $USERDEF"
    else
      CMDLINE="$MPLAYER -vo $VO $AOUT -vf scale=$NEW_X:${NEW_Y}${DETC},expand=$NEW_X:$REAL_Y:-1:-1:1,$VOP:$NEW_FPS $SPEED $FDSTR $CACHESTR $REMOTE $SUBTITLES $USERDEF $FORCEIDX"
    fi
fi

debugvar CMDLINE "$CMDLINE"
exec $CMDLINE "$FILE"
exit
