#!/bin/sh
# simple script to start GeoGebra

func_usage()
{
cat << _USAGE
Usage: geogebra [Java-options] [GeoGebra-options] [FILE]

GeoGebra - Dynamic mathematics software

Java options:
  -Xms<size>                       Set initial Java heap size
  -Xmx<size>                       Set maximum Java heap size

GeoGebra options:
  --help                           Show this help message
  --language=<iso_code>            Set language using locale code, e.g. en, de_AT
  --showAlgebraInput=<boolean>     Show/hide algebra input field
  --showAlgebraWindow=<boolean>    Show/hide algebra window
  --showSpreadsheet=<boolean>      Show/hide spreadsheet
  --fontSize=<number>              Set default font size
  --showSplash=<boolean>           Enable/disable the splash screen
  --enableUndo=<boolean>           Enable/disable Undo
  --CAS=[Maxima|MathPiper]         Set Maxima/MathPiper as CAS engine
  --maximaPath=<path>              Set path to locally installed version of Maxima
_USAGE
}

# check for option --help and pass memory options to Java, others to GeoGebra
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

# if memory not set, change to GeoGebra defaults
if [ $(expr match "$JAVA_OPTS" ".*-Xmx") -eq 0 ]; then
	JAVA_OPTS="$JAVA_OPTS -Xmx512m"
fi
if [ $(expr match "$JAVA_OPTS" ".*-Xms") -eq 0 ]; then
	JAVA_OPTS="$JAVA_OPTS -Xms32m"
fi

# run
exec java $JAVA_OPTS -jar /usr/share/java/geogebra/geogebra.jar --primary=true $GG_OPTS "$@"
