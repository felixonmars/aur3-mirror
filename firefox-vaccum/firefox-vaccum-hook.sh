function firefox_vaccum(){

	counter=`cat /etc/firefox-vaccum-seek`

	if [[ $counter = "10" ]]
	then
		stat_busy "Optimizing Firefox database"
		/usr/bin/firefox-vaccum > /dev/null 2>&1
		echo 0 > /etc/firefox-vaccum-seek
		stat_done
	else
		echo `expr $counter + 1` > /etc/firefox-vaccum-seek
	fi
}

add_hook shutdown_postkillall firefox_vaccum
