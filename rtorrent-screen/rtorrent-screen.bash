#!/bin/bash
# rtorrent-screen 1.0 (Harvie 2oo9)
# - Simple rtorrent manager (keeps your torrents in screen transparently + allows you to monitor it using hardcopies)
#
# - Dependencies: bash, screen, rtorrent
#   - Optionaly webserver with PHP (you will be allowed to monitor your torrents using web interface)
# - TODO: adding torrents using web interface...

TARGET_DIRECTORY=~/downloads #warning: each user MUST have his own directory for downloading (on "single user" system u can use eg. /srv/http/downloads)
SCREEN_PID_FILE='rtorrent-screen.pid'
SCREEN_DUMP_INTERVAL=30;
SESSION_NAME='rtorrent'
CREATE_PHP_UI=true
PHP_UI='download.php'

CONFIG_OVERRIDE=~/.config/rtorrent-screen.rc.sh
#source "$CONFIG_OVERRIDE" 2>/dev/null

cd "$TARGET_DIRECTORY";
if [ $? != 0 ]; then
	echo Directory "$TARGET_DIRECTORY" does not exists create it or change path in "$CONFIG_OVERRIDE" or in "$0"
	echo Note that each user MUST have his own separate directory for rtorrent-screen to avoid collisions.
	exit 2;
fi;

#PHP UI
if "$CREATE_PHP_UI"; then
echo "
<head>
	<title>Harvie's Downloads</title>
</head>
<style>
	* { font-size: small; color: green; background-color: black; }
	b,i,u { color: lime; }
</style>
<pre><?php
	if(is_file('$SCREEN_PID_FILE')) {
		echo(
			'rTorrent is running. To attach to it login as <b>$USER</b> and type: <b>$0</b> or <b>screen -x '.
			htmlspecialchars(file_get_contents('$SCREEN_PID_FILE')).
			'</b>If you want to detach from it (leave it running on background) press <b>CTRL+a followed by d</b> and if you want to stop rTorrent definitely then press <b>CTRL+q</b> few times.<hr />'.
			htmlspecialchars(file_get_contents('./hardcopy.0'))
		);
	} else {
		echo('rTorrent is not running at this time... To execute it use command: <b>$0</b>');
	}
?></pre>
" > "$PHP_UI"
fi;

#SCREEN SESSION
if [[ -r "$SCREEN_PID_FILE" ]]; then
	screen -x $(cat "$SCREEN_PID_FILE");
else
	screen -U -S "$SESSION_NAME" -t "$SESSION_NAME" bash -c "
		while true; do
			sleep 1;
			screen -S \$PPID -X hardcopy;
			sleep $SCREEN_DUMP_INTERVAL;
		done &

		echo \$PPID > $SCREEN_PID_FILE;
		rtorrent;
		rm -f $SCREEN_PID_FILE;
		rm -f hardcopy.0;
	"
fi;

echo 'Thank you for using rtorrent-screen by Harvie'
