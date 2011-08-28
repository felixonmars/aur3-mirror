#!/bin/bash
#---------------------------------------------
# Script to start GeoGebra
#---------------------------------------------

#---------------------------------------------
# Define usage function

func_usage()
{
cat << _USAGE
Usage: $GG_SCRIPTNAME [Java-options] [GeoGebra-options] [FILE]

GeoGebra - Dynamic mathematics software

Java options:
  -Xms<size>                        Set initial Java heap size
  -Xmx<size>                        Set maximum Java heap size

GeoGebra options:
  --help                            Show this help message
  --v                               Show version information
  --language=<iso_code>             Set language using locale code, e.g. en, de_AT
  --showAlgebraInput=<boolean>      Show/hide algebra input field
  --showAlgebraInputTop=<boolean>   Show algebra input field at top/bottom
  --showAlgebraWindow=<boolean>     Show/hide algebra window
  --showSpreadsheet=<boolean>       Show/hide spreadsheet
  --showCAS=<boolean>               Show/hide CAS window
  --showSplash=<boolean>            Enable/disable the splash screen
  --enableUndo=<boolean>            Enable/disable Undo
  --fontSize=<number>               Set default font size
  --showAxes=<boolean>              Show/hide coordinate axes
  --settingsFile=<path>|<filename>  Load/save settings from/in a local file
  --resetSettings                   Reset current settings
  --CAS=[MPREDUCE|MAXIMA|MATHPIPER] Select which CAS to use, default MPREDUCE
  --maximaPath=<path>               Specify where Maxima is installed and select Maxima as current CAS
  --antiAliasing=<boolean>          Turn anti-aliasing on/off
  --regressionFile=<filename>       Export textual representations of dependent objects, then exit
_USAGE
}

#---------------------------------------------
# Check for option --help and pass memory options to Java, others to GeoGebra

for i in "$@"; do
	case "$i" in
	--help | --hel | --he | --h )
		func_usage; exit 0 ;;
	esac
	if [ $(expr match "$i" '.*-Xm') -ne 0 ]; then
		if [ -z "$JAVA_OPTS" ]; then
			JAVA_OPTS="$i"
		else
			JAVA_OPTS="$JAVA_OPTS $i"
		fi
		shift $((1))
	else
		if [ $(expr match "$i" '.*--') -ne 0 ]; then
			if [ -z "$GG_OPTS" ]; then
				GG_OPTS="$i"
			else
				GG_OPTS="$GG_OPTS $i"
			fi
			shift $((1))
		fi
	fi
done

#---------------------------------------------
# If memory not set, change to GeoGebra defaults

if [ $(expr match "$JAVA_OPTS" '.*-Xmx') -eq 0 ]; then
	JAVA_OPTS="$JAVA_OPTS -Xmx512m"
fi
if [ $(expr match "$JAVA_OPTS" '.*-Xms') -eq 0 ]; then
	JAVA_OPTS="$JAVA_OPTS -Xms32m"
fi

#---------------------------------------------
# Run

exec java $JAVA_OPTS -jar "/usr/share/java/geogebra5-beta/geogebra.jar" $GG_OPTS "$@"
