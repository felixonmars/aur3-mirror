#!/bin/sh
### My Google Google Chrome Updater ###

	cd /usr/share/chrome-update;
	
	is_file_exits(){
	local f="$1"
	[[ -f "$f" ]] && return 0 || return 1
	}

if !(is_file_exits "/home/`whoami`/.chromeblock") then
	if (is_file_exits "/home/`whoami`/.chrome-update-history") then
		if [[ `date +"%j"` != `sed -ne '1p' "/home/\`whoami\`/.chrome-update-history"` ]]; then
			if ping -c 1 8.8.8.8 > /dev/null; then
			echo -e "`date +'%j'`\n`curl "http://aur.archlinux.org/rpc.php?type=info&arg=37469" | sh json.sh | egrep '\["results","Version"\]' | cut -f2`" > "/home/`whoami`/.chrome-update-history";
			fi
		fi
	else
		if ping -c 1 8.8.8.8 > /dev/null; then
		echo -e "`date +'%j'`\n`curl "http://aur.archlinux.org/rpc.php?type=info&arg=37469" | sh json.sh | egrep '\["results","Version"\]' | cut -f2`" > "/home/`whoami`/.chrome-update-history";
		fi
	fi


	if [[ *`sed -ne '2p' "/home/\`whoami\`/.chrome-update-history"`* !=  *`google-chrome --version | cut -d " " -f3`* &&  `sed -ne '2p' "/home/\`whoami\`/.chrome-update-history"` != "" ]]; then
		notify-send --icon=google-chrome "Update" "New Update is there."
		pkexec sh /usr/share/chrome-update/update_chrome.sh
	else
		google-chrome 
	fi
else
	notify-send --icon=edit-delete "Nice try, but we are not ready yet.";
	firefox "http://www.google.com/pacman/";
fi