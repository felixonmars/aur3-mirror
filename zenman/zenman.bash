#!/bin/bash
#BANNER#######################################
echo -n '
 ____  ____  __ _  _  _   __   __ _
(__  )(  __)(  ( \( \/ ) / _\ (  ( \
 / _/  ) _) /    // \/ \/    \/    /
(____)(____)\_)__)\_)(_/\_/\_/\_)__) v1.8

  Zenity based frontend for pacman
  <~Harvie (http://blog.harvie.cz)
  2oo9

';

#HELP/FEATURES################################
if [ "$1" == '--help' ]; then
cat << END
HELP/FEATURES:
- note this script is not much secure since it uses gksu to execute user defined scripts
	- this is not good idea for server, but it should be OK for personal workstation
	- root rights can be obtained by gksu anyway
	- to defeat this risk please do not use 'remember password' in gksu
- zenman --help prints this help
- when zenman started, kills last zenman runned by this user
	- you can kill zenman by zenman --stop (click on tray icon or wait after this)
	- last pid is stored in ~/.config/zenman/zenman.pid
- shows splashscreen (can be disabled...)
- shows tray icon for each state (on mouse over shows state)
	- system is up to date
	- refreshing pacman database
	- updates available
- shows notification when updates available and listing them
	- optionally can notify also using speech output
- clicking on icon will begin upgrade in new xterm
	- this is disabled only when refreshing
	- if pacman db is locked it will be automaticaly unlocked
		- only if there is any pacman related process running
		- if there is some pacman related operation, error message appears
- auto refreshing of pacman db is disabled (somebody will want to use cron)
- all settings are hardcoded to zenman (/usr/bin/zenman)
  - all settings can be overrided
		- system wide: /etc/zenman.conf
		- single user only: ~/.config/zenman/zenman.conf
		- you can also write your own translation to this files

TODO:
( Don't shy and get involved! ;o)
- Bugtracking/Bugfixing
- Port to another package managers
  - apt-zen (apt-get)
  - zenmerge (emerge)
  - ipkg-zen (ipkg)
  - etc...
- Localization to your native language
END
exit;
fi;

#SETTINGS#####################################
#main#############################
    zenman_caption='ZenMan';
   zenman_interval=$[10*60];
     zenman_splash=true;
zenman_autorefresh=false;
     zenman_speech=true;
  zenman_configdir=~/.config/zenman;
        zenman_pid="$zenman_configdir/zenman.pid";
   zenman_true_ico='/usr/share/icons/gnome/48x48/status/software-update-urgent.png'; #software-update-available.svg
  zenman_false_ico='/usr/share/icons/gnome/48x48/emotes/face-cool.png';
zenman_refresh_ico='/usr/share/icons/gnome/48x48/actions/view-refresh.png';

#files/commands###################
              gksu='gksu'; #gksu/gksudo/...
            pacman='/usr/bin/pacman'; #want to use pacman-color, yaourt or powerpill instead?
             xterm='/usr/bin/xterm'; #xterm/...
            espeak='/usr/bin/espeak' #espeak (for spoken notification)
    pacman_refresh='-Syuw'; # -Sy ?
    pacman_upgrade='-Syu'; # -Syuf ?
      pacman_check='-Qu';
       pacman_lock='/var/lib/pacman/db.lck'; #file to delete, when pacman locked (only if not running)

#Translate here###################
       zenman_true='New package(s) found! ;-)\n\nPacman output follows:\n';
      zenman_false='No packages to update. ;-(';
 zenman_refreshing='Refreshing pacman database. ;-) Please wait...';
      zenman_usage="[i] $0 --stop to kill zenman\n[i] $0 --help to show help\n"
    zenman_upgrade="[*] ZenMan will now execute full system upgrade! ;-)\n\n'$pacman' '$pacman_upgrade'\n\n";
      zenman_close='[*] Press [ENTER] to close window...';
     zenman_config='[*] Loading configuration from: ';
       zenman_done='[DONE]';
     zenman_locked="ZenMan can't execute system upgrade! ;-(
Please stop all pacman related applications and try again.";
      zenman_start="ZenMan started! ;-)
by: Harvie 2oo9
For more informations please visit:
http://blog.harvie.cz/";

#voice
      espeak_voice='en'; #see: espeak --voices
     espeak_volume='200'; #0-200
       speech_true='New packages found!';

#INIT#########################################
if [ "$2" != '' ]; then zenman_configdir="$2"; fi; #when called with --upgrade
mkdir -p "$zenman_configdir"
touch "$zenman_configdir/zenman.conf"
#read configuration files (can contain localization also)...
for i in\
	'/etc/zenman.conf'\
	"$zenman_configdir/zenman.conf"\
; do
	echo "$zenman_config" "$i";
	source "$i" >/dev/null 2>&1;
done;
if [ "$2" != '' ]; then zenman_configdir="$2"; fi; #when called with --upgrade

#fallback icons
   if [ ! -e "$zenman_true_ico" ]; then zenman_true_ico='warning'; fi;
  if [ ! -e "$zenman_false_ico" ]; then zenman_false_ico='info'; fi;
if [ ! -e "$zenman_refresh_ico" ]; then zenman_false_ico='question'; fi;


#CODE#########################################
#pid
if [ -e "$zenman_pid" ]; then
	kill $(cat "$zenman_pid") >/dev/null 2>&1;
	kill -KILL $(cat "$zenman_pid") >/dev/null 2>&1;
fi;
if [ "$1" == '--stop' ]; then
	echo '[!] exit';
	exit;
fi;
echo "$$" > "$zenman_pid";

#this procedure is called internally...
if [ "$1" == '--upgrade' ]; then
	echo -ne "$zenman_upgrade";
	"$pacman" $pacman_upgrade;
	if [ $? != 0 ]; then
		echo -e "\n$zenman_close";
		read;
	else
		sleep 2;
	fi;
	exit;
fi;

#splash
echo -e "$zenman_usage"
if "$zenman_splash"; then
	notify-send -i info --expire-time=5000 "$zenman_caption" "$zenman_start";
fi;


#text-to-speech
zenman_speech() {
	if "$zenman_speech" && [[ -x "$espeak" ]] ; then
		"$espeak" -a "$espeak_volume" -v "$espeak_voice" "$1" &
	fi;
}

#unlocker
zenman_force_unlock() {
	if [ -e "$pacman_lock" ]; then #check if db locked...
		ps -eo comm | grep -i '^\(pacman\|yaourt\|powerpill\|gtkpacman\|pacupdate\|kpacupdate\|guzuta\|YAPG\|Shaman\)' >/dev/null; #check if pacman is running...
  	if [ $? != 0 ]; then
			"$gksu" "rm -rf '$pacman_lock'";
			if [ $? != 0 ]; then
				return 1; #gksu failed ;-(
			else
				return 0; #unlocked!!!
			fi;
		else
			return 1; #pacman is running ;-(
		fi;
	else
		return 0; #no locked!!!
	fi;
}


while true; do
	#uncomment next line if not running -Syuw from cron (and you better set higher zenman_interval)
	if "$zenman_autorefresh"; then
		echo -ne "$zenman_refreshing ";
		zenity --notification --text "$zenman_refreshing" --window-icon="$zenman_refresh_ico" &
			zenman_force_unlock;
			"$gksu" "'$pacman' $pacman_refresh --noconfirm" >/dev/null 2>&1
		kill $! >/dev/null 2>&1;
		kill -KILL $! >/dev/null 2>&1;
		echo "$zenman_done";
	fi;
	#check for new packages
	pacman_new_packages=$("$pacman" $pacman_check --noconfirm 2>&1);
	if [ $? == 0 ] && [ "$pacman_new_packages" != '' ]; then #fixed pacman always returning 0 issue...
		#new packages found
		zenman_speech "$speech_true";
		notify-send -i info "$zenman_caption" "$(echo -e "$zenman_true" "$pacman_new_packages")"
		zenity --notification --timeout="$zenman_interval" --text "$(echo -e "$zenman_true" "$pacman_new_packages")" --window-icon="$zenman_true_ico";
	else
		#no packages to update
		zenity --notification --timeout="$zenman_interval" --text "$zenman_false" --window-icon="$zenman_false_ico";
	fi;

	#run full system upgrade if notification icon clicked
	if [ $? == 0 ]; then
		#try to unlock pacman db if locked and pacman is not running
		zenman_force_unlock;
		if [ $? == 0 ]; then
			#update if unlocked
			"$gksu" " '$xterm' -T '$zenman_caption' -e '$0 --upgrade \\\\'$zenman_configdir\\\\\''" ###TODO: fix quotes and escaping for configdir here later!!!!
			zenman_force_unlock;
		else
			#show error if locked
			notify-send -i error "$zenman_caption" "$zenman_locked";
		fi;
	fi;
done;
