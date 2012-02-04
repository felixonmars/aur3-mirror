#!/bin/sh
java -Dawt.useSystemAAFontSettings=on \
	-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel \
	-jar /usr/lib/tilitin/tilitin.jar $@
