#!/bin/sh
# This is a simple script to restore the custom widgets, if firefox was updated.

cd /opt/mozilla/lib/firefox/res

case $1 in
	install)
		if [ "`grep "ahM3cie1Ch" forms.css`" == "" ]; then
			cp forms.css forms.css.bak
			cat forms.css.bak forms-extra.css > forms.css
			echo "/* ahM3cie1Ch */" >> forms.css
		else
			echo "It seems that the custom widgets are already installed."
		fi
		;;
	reset)
		cp forms.css.bak forms.css
		;;
	*)
		echo "Usage:"
		echo "install - installs the widgets"
		echo "remove - removes the widgets"
		;;
esac