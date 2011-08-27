#!/bin/bash
# v. 0.7.1
# Description: Tells you which websites have changed since last run/mirroring.

# set colors
OLD=$(tput setaf 1) # red
SAMELINE=$(tput setaf 4) # blue
NEW=$(tput setaf 2) # green

INFO=$(tput setaf 3) #yellow
NORMAL=$(tput setaf 7) #gray

#how wide is your terminal or how much text in width would you like to include in the output? see echo $COLUMNS for how many letters you can show on one line, it doesn't work inside a script for some reason..
TERMWIDTH=180
#BLUE="\033[1;34m"
# $colour{cyan}        = "\033[1;36m";
# $colour{red}         = "\033[1;31m";

function _show_help() {
echo -e "\nupdcheck 0.7.1\n\nusage: updcheck [--no-colors] [-h|--help] \n\nTells you which webpages of the ones in \`${HOME}/.updcheck/urls' have changed since last mirroring. The first time you run with a new entry it will mirror the entry, the second time it will check for differences, and tell you if it finds any discrepancies.\n\n --no-colors    Turn off colors\n"
exit 0
}

if [ "$1" = "-h" -o "$1" = "--help" ]
then
  _show_help
fi

function _diff() {
    #git diff --color x y...
    diff -w -W $TERMWIDTH -y --suppress-common-lines mirrors/$_url2 $_url2|sed "s#\(.*|.*\)#`echo $SAMELINE`&#"|sed "s#\(.*>.*\)#`echo $NEW`&#"|sed "s#\(.*<.*\)#`echo $OLD`&#"
    if [ $PIPESTATUS -eq 1 ]
    then
	echo $INFO && echo -n $_url2|sed 's|,|/|g' && echo " have updated." && echo $NORMAL
    fi
    # mv new copy over the old one
    mv $_url2 mirrors/
}

function _diff_no_colors() {
	diff -w -W $TERMWIDTH -y --suppress-common-lines mirrors/${_url2} ${_url2}
	if [ $? -eq 1 ]
	then
	    echo "`echo $_url2|sed 's|,|/|g'` have updated."
	fi
	# mv new copy over the old one
	mv ${_url2} mirrors/
}

# create needed directories upon first run
if [ ! -d "${HOME}/.updcheck/mirrors" ]
then
	mkdir -p ${HOME}/.updcheck/mirrors
	touch ${HOME}/.updcheck/urls
	echo "Creating ´~/.updcheck/mirrors...urls. Fill in ´~/.updcheck/urls´"
	echo -e "# Works best with pages that doesn't look different\n# each time you refresh it(because of ads, a clock/date script etc)\n# but perhaps the download page or the news page for example.\n# Example:\n# http://en.wikipedia.org/wiki/Linux\n# " > ${HOME}/.updcheck/urls
fi

# cd into standard dir
cd ${HOME}/.updcheck

#start file-reading loop
while read _url; do
# set _url to use , instead of / for processing
_url2=`echo ${_url}|sed 's|/|,|g'`
elinks -dump -no-numbering -no-references -no-connect 0 -no-home 1 "${_url}" > "$_url2"

#is it already mirrored? in that case diff it against the new file!
if [ -f mirrors/${_url2} -a -f ${_url2} ]
then
	if [ "$1" = "--no-colors" ]
	then
		_diff_no_colors
	else
		_diff
	fi
fi

#mirror doesn't exist. create mirror
if [ ! -f mirrors/${_url2} ];
then
	mv ${_url2} mirrors/
	if [ "$1" = "--no-colors" ]
	then
	    echo "Making mirror of" `echo $_url2|sed 's|,|/|g'`
	else
	    echo $INFO && echo "Making mirror of $_url2"|sed 's|,|/|g' && echo $NORMAL
	fi
fi
done < <(egrep -v "^$|#" urls)