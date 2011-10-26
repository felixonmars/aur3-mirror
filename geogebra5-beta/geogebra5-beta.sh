#!/bin/bash
#---------------------------------------------
# Script to start GeoGebra
#---------------------------------------------

#---------------------------------------------
# Used environment variables:

# GG_XMS=<initial Java heap size> # If unset, 32m will be used.
#
# GG_XMX=<maximum Java heap size> # If unset, 512m will be used.
#
# GG_DJAVA_LIBRARY_PATH=<native library path>

#---------------------------------------------
# If GG_XMS not set, set to 32m

if [ -z "$GG_XMS" ]; then
	GG_XMS='32m'
fi

#---------------------------------------------
# If GG_XMX not set, set to 512m

if [ -z "$GG_XMX" ]; then
	GG_XMX='512m'
fi

#---------------------------------------------
# Set Java default options

JAVA_OPTS=("-Xms$GG_XMS" "-Xmx$GG_XMX")
if [ -n "$GG_DJAVA_LIBRARY_PATH" ]; then
	JAVA_OPTS[${#JAVA_OPTS[*]}]="-Djava.library.path=$GG_DJAVA_LIBRARY_PATH"
fi

#---------------------------------------------
# Set GeoGebra default options

GG_OPTS=(--primary=true)

#---------------------------------------------
# Define usage function

func_usage()
{
cat << _USAGE
Usage: geogebra [Java-options] [GeoGebra-options] [FILE]

GeoGebra - Dynamic mathematics software

Java options:
  -Xms<size>                         Set initial Java heap size, default $GG_XMS
  -Xmx<size>                         Set maximum Java heap size, default $GG_XMX
  -Djava.library.path=<path>         Set native library path`if [ -n "$GG_DJAVA_LIBRARY_PATH" ]; then echo ", default $GG_DJAVA_LIBRARY_PATH"; fi`

GeoGebra options:
  --help                             Print this help message
  --v                                Print version
  --language=<iso_code>              Set language using locale code, e.g. en, de_AT
  --showAlgebraInput=<boolean>       Show/hide algebra input field
  --showAlgebraInputTop=<boolean>    Show algebra input field at top/bottom
  --showAlgebraWindow=<boolean>      Show/hide algebra window
  --showSpreadsheet=<boolean>        Show/hide spreadsheet
  --showCAS=<boolean>                Show/hide CAS window
  --showSplash=<boolean>             Enable/disable the splash screen
  --enableUndo=<boolean>             Enable/disable Undo
  --fontSize=<number>                Set default font size
  --showAxes=<boolean>               Show/hide coordinate axes
  --showGrid=<boolean>               Show/hide grid
  --settingsfile=[<path>|<filename>] Load/save settings from/in a local file
  --resetSettings                    Reset current settings
  --antiAliasing=<boolean>           Turn anti-aliasing on/off
  --regressionFile=<filename>        Export textual representations of dependent objects, then exit
_USAGE
}

#---------------------------------------------
# Check for option --help and pass Java options to Java, others to GeoGebra

for i in "$@"; do
	case "$i" in
	--help | --hel | --he | --h )
		func_usage; exit 0 ;;
	esac
	if [ $(expr match "$i" '.*--') -ne 0 ]; then
		GG_OPTS[${#GG_OPTS[*]}]="$i"
		shift $((1))
	elif [ $(expr match "$i" '.*-Xms') -ne 0 -o $(expr match "$i" '.*-Xmx') -ne 0  -o $(expr match "$i" '.*-Djava.library.path') -ne 0 ]; then
		JAVA_OPTS[${#JAVA_OPTS[*]}]="$i"
		shift $((1))
	fi
done

#---------------------------------------------
# Run

exec java "${JAVA_OPTS[@]}" -jar "/usr/share/java/geogebra5-beta/geogebra.jar" "${GG_OPTS[@]}" "$@"
