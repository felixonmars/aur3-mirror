#!/bin/bash
# скрипт-велосипед повзоляет произвести отмонтирование отчуждаемых носителей
# вывод осуществляется с помощью dmenu
# Распространяется по лицензии GPLv2
# зависимости: awk, pmount, bash, libnotify, dmenu
# ограничим круг на устройствах  cd/dvd и FS vfat,ntfs,ext2
DEV="$(mount | awk '/vfat|ntfs|udf|iso9660|ext2/ {print $1}')"
DEV_OK="0"
STR_DEV="$(mktemp)"; :> "${STR_DEV}"
LOGO_ERR="/usr/share/dmenu/USB-HD_err.png"
LOGO_OK="/usr/share/dmenu/USB-HD.png"

exit_() 
{
 rm -f "${STR_DEV}" 2>/dev/null
 if [ "x$1" = "x0" -o "x$1" = "x" ]; then 
	exit
 else 
	echo $1
	exit 
 fi
}

[[ -z $DEV ]] && exit_ "Nothing to do"

for d in $DEV; do
	D="${d%%[0-9]*}"
	D="$(basename $D)"
# если cd/dvd, то обрезать номер устройства не нужно	
	[ "${D}" = "sr" -o "${D}" = "cdrom" -o "${D}" = "cdrw" -o "${D}" = "cdrom" -o "${D}" = "dvdrw" -o "${D}" = "dvd" ] && D="${d}"
	
# определим устройство removable?
	REM="$(cat /sys/block/${D}/removable)"
	if [[ "$REM" = "1" ]]; then
# определим точку монтирования и отправим во временный файл
		m_point=$(grep "${d}" /proc/mounts | awk '{print $2}')
		echo "${m_point} ($d)" >> "${STR_DEV}"
		DEV_OK=$(( ${DEV_OK} + 1))
	fi
done

if [ "${DEV_OK}" -gt "0" -a -r "${STR_DEV}" ]; then
 
 ans=$(cat "${STR_DEV}" | dmenu -p 'Umount:' | awk '{ print $2 }' | tr -d ')(')
 
 [[ -z ${ans} ]] && exit_ "var \'ans\' is null"
# попробуем отмонтировать выбранное устройство
# по реезультату произведем нотификацию
 pumount "${ans}"
 if [[ "$?" != "0" ]]; then 
   notify-send -i "${LOGO_ERR}" -t 5000 -u critical "Umount \"${ans}\" error!"
  else
   notify-send -i "${LOGO_OK}" -t 5000 -u low "Umount \"${ans}\" succsessful!"
 fi
 
fi

exit_ 0
