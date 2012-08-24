#!/bin/bash
case $1 in 
    --remove)
	find $HOME/.config/{google-chrome,chromium}/Default/Extensions -name 'Orta*crx' -delete 2>/dev/null;
	echo "Removed Orta Chrome/Chromium Themes"
	;;
    *)
	for folder in google-chrome chromium; do 
	    find /usr/share/themes/orta-chromium-themes -name 'Orta*crx' -exec install -Dm644 '{}' $HOME/.config/$folder/Default/Extensions/'{}' \;
	done
	echo "Installed Orta Chrome/Chromium Themes"
	;;
esac
