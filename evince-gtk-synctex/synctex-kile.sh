#!/bin/bash
# Open viewer at specified location via synctex.
#
# You need to compile your tex files with pdflatex and use the
# argument --synctex=1. This can be done in Kile by going to Settings
# -> Configure Kile -> Build -> PDFLaTeX -> General and there adding
# --synctex=1 to the arguments fiels.
#
# To run from Kile, add a build target based on ForwardDVI
# that runs /path/to/this/script.sh with argument '%target'
#
# If you would like to be able to compile & view with one command, a
# "sequence" target can be used to run PDFLaTeX and then this.
#
# Run this sequence tool to compile latex and then open evince on the
# corresponding line.
#
# To go from Evince to Kile, you just need to doubleclick in the PDF.


regex="file:([^#]*)#src:([0-9]*) (.*)$"
[[ "$1" =~ $regex ]]
BASEDIR=`dirname ${BASH_REMATCH[1])}`
BASEFILE=`basename ${BASH_REMATCH[1])}`
LINE=${BASH_REMATCH[2])}
COLUMN=0
FILE=${BASH_REMATCH[3])}

MAINFILE=$( echo "${BASEFILE}" | awk 'sub(".tex","")' )
cd "$BASEDIR"

####################################
## View with synctex
####################################
# Linenumber must is 0-based
LINE=$(( ${LINE} - 1 ))
# Get filename relative to current directory, used if synctex file contains
# relative paths (this happens when pdflatex is building in the same
# directory as ${MAINFILE}.tex)
FILE=$( echo "${FILE}" | awk 'sub("./","")' )

# Call synctex
SYNCTEX_RESULT=$( synctex view -i "$LINE:$COLUMN:$FILE" -o "${MAINFILE}.pdf" -x "echo ::%{page}:%{h}:%{v}:%{width}:%{height}::" )

# Use bash built-in regex to parse data
[[ $SYNCTEX_RESULT =~ ::([^:]+):([^:]+):([^:]+):([^:]+):([^:]+):: ]]

# Did synctex succed
if [ "${BASH_REMATCH[0]}" ]; then
	# Get results from regex matching
	page=$(( ${BASH_REMATCH[1]} + 1 ))
	x=${BASH_REMATCH[2]}
	y=${BASH_REMATCH[3]}
	width=${BASH_REMATCH[4]}
	height=$( expr $( echo ${BASH_REMATCH[5]} | grep -o ^[0-9] ) \* 2 )
	#~ height=2
	evince --use-absolute-page --page-label "$page" --highlight-rect "${x}:${y}:${width}:${height}" "${MAINFILE}.pdf" 2>/dev/null &
else
	echo "Synctex did not return usable results, viewing without synctex"
	evince "${MAINFILE}.pdf" 2>/dev/null &
fi
