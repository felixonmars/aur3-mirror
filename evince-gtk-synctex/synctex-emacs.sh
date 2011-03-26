#!/bin/bash
# Compile latex document and open viewer at specified location via synctex
# latexmk (included in texlive-bin) and wmctrl are used by the script. wmctrl
# is used to give evince focus after updating the document, you don't have to
# install it, if you don't want this functionality.

# latexmk is used to compile document - it should automatically
# compile your document multiple times and run bibtex as required.
# You have to tell latexmk to use the --synctex=1 option when running
# pdflatex, to do so, create a file ~/.latexmkrc containing:
#       $pdflatex = 'pdflatex --interaction nonstopmode --synctex=1 %O %S';
# There must be a newline after this line. I havent found any way to
# give this info to latexmk directly from the commandline, but that
# would be alot easier.

# To get AUCTEX to use this scipt, add the following lines to your .emacs file:
# You can then use C-c C-c Synctex RET to compile and view in evince
#        (eval-after-load "tex"
#            '(add-to-list 'TeX-command-list 
#                         '("Synctex" "/etc/scripts/synctex-emacs.sh %t %b %n" TeX-run-TeX nil t) t)) 

MAINFILE=$1
FILE=$2
LINE=$3
COLUMN=-1
PDFFILE="$(echo "$MAINFILE" | sed 's/\.tex/\.pdf/g')"

########################################
## Compile document
########################################
latexmk -pdf "$MAINFILE"
if [ $? -eq 0 ]; then
####################################
## succesful latex compilation -> view with synctex
####################################
	# Call synctex
	SYNCTEX_RESULT=$( synctex view -i "$LINE:$COLUMN:$FILE" -o "${PDFFILE}" -x "echo ::%{page}:%{h}:%{v}:%{width}:%{height}::" )

	# Use bash built-in regex to parse data
	[[ $SYNCTEX_RESULT =~ ::([^:]+):([^:]+):([^:]+):([^:]+):([^:]+):: ]]

	# Did synctex succed
	if [ "${BASH_REMATCH[0]}" ]; then
		# Get results from regex matching
		page=$( expr ${BASH_REMATCH[1]} + 1 )
		x=${BASH_REMATCH[2]}
		y=${BASH_REMATCH[3]}
		width=${BASH_REMATCH[4]}
		height=1
		# height=$( expr $( echo ${BASH_REMATCH[5]} | grep -o ^[0-9] ) \* 2 )
		nohup evince --use-absolute-page --page-label "$page" --highlight-rect "${x}:${y}:${width}:${height}" "${PDFFILE}" >/dev/null &
	else
		echo "Synctex did not return usable results, viewing without synctex"
		nohup evince "${PDFFILE}" >/dev/null &
	fi
	wmctrl -xa evince
	exit 0
else
    exit 1
fi
