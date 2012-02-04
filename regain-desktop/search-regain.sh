#! /bin/bash

# A quick'n'dirty GNOME Search Box for Regain similar to
# Google Desktop's Quick Search Box.
# Install zenity, start Regain and assign a hotkey to this script.

# Please note: This script was not provided by the authors of Regain, but
# by the maintainer of the PKGBUILD - Frank Poehler <fp29129@googlemail.com>.
# It is released under the same license as Regain.
# For questions, suggestions or bug reports regarding this script,
# just drop me a line.

searchterm=`zenity --entry --title="Search Regain" --text="Please enter your search term."`
if ! test -z "$searchterm" ; then
    xdg-open http://localhost:8020/search.jsp?query="$searchterm"&order=relevance_desc &
fi
exit 0

