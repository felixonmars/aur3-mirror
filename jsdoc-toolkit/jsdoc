#!/bin/sh

# launcher script for jsdoc
# Author: Avi Deitcher
# Modified by Georges Khaznadar <georgesk@ofset.org>
#
# This program is released under the MIT License as follows:

# Copyright (c) 2008-2009 Atomic Inc <avi@jsorm.com>
# Copyright (c) 2011 Georges Khaznadar
#
#Permission is hereby granted, free of charge, to any person
#obtaining a copy of this software and associated documentation
#files (the "Software"), to deal in the Software without
#restriction, including without limitation the rights to use,
#copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the
#Software is furnished to do so, subject to the following
#conditions:
##
#The above copyright notice and this permission notice shall be
#included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
#OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
#HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
#WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
#OTHER DEALINGS IN THE SOFTWARE.
#

check_mandatory_option(){
    for a in "$@"; do
	if [ "$a" = -h ] || [ "$a" = --help ]; then ok=1; fi
	outdir=$(echo "$a" | sed -n 's/-d=\(.\+\)/-d="\1"/p')
	if [ -n "$outdir" ]; 
	then 
	    ok=1
	else
	    outdir=$(echo "$a" | sed -n 's/--directory=\(.\+\)/--directory="\1"/p')
	    if [ -n "$outdir" ]; 
	    then
		ok=1
	    fi
	fi
    done
    
    if ! [ "$ok" = 1 ]; then
	echo "An argument like -d=<directory> or --directory=<directory> is mandatory!"
	echo "Try 'jsdoc --help' or 'man jsdoc' for more information."
	exit 1
    fi
}

check_mandatory_option $@

if [ -n "$JSDOCDIR" ]; then
        _DOCDIR="-Djsdoc.dir=$JSDOCDIR"
else
        _DOCDIR=""
fi

if [ -n "$JSDOCTEMPLATEDIR" ]; then
        _TDIR="-Djsdoc.template.dir=$JSDOCTEMPLATEDIR"
else
        _TDIR="-Djsdoc.template.dir=/usr/share/jsdoc-toolkit/templates/jsdoc"
fi

CMD="java $_DOCDIR $_TDIR -cp /usr/share/java/jsrun.jar:/usr/share/java/js.jar JsRun /usr/share/jsdoc-toolkit/app/run.js $@"
echo $CMD
$CMD
