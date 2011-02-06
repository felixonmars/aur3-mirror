#!/bin/bash
# скрипт-велосипед позволяет монтировать отчуждаемые носители
# используется dmenu для удобного отображения
# Распространяется по лицензии GPLv2
# зависимости: udisks, bash, awk, libnotify, dmenu
DEV=$(ls /sys/block/ | awk '/sd|hd|sr/')
DEV_OK=""
ERR="$(mktemp)"; :> "${ERR}"
DEV_STR="$(mktemp)"; :> "${DEV_STR}"
COUNT="0"
LOGO_ERR="/usr/share/dmenu/USB-HD_err.png"
LOGO_OK="/usr/share/dmenu/USB-HD.png"

exit_() 
{
 rm -f "${DEV_STR}" 2>/dev/null
 rm -f "${ERR}" 2>/dev/null
 if [ "x$1" = "x0" -o "x$1" = "x" ]; then 
	exit
 else 
	echo $1
	exit 
 fi
}

[[ "$DEV" = "" ]] && exit_ 0
[[ -x $(which udisks) ]] || exit_ "udisks not found"

# Найдем отчуждаемые носители и заполним их именами массив DEV_OK
for d in $DEV; do
	REM="$(cat /sys/block/${d}/removable)"
	if [[ "$REM" = "1" ]]; then
# CD/DVD отдельная песня
		if [[ $d = sr* ]]; then 
			DEV_OK+=" $d"
		else
			num=$(ls /sys/block/${d}/ | grep "${d}[0-9]")
			if [[ "$num" = "" ]]; then 
			  DEV_OK+=" $d"
			else
			  DEV_OK+=" ${num}"
			fi
		fi
	fi
done


if [[ "${DEV_OK}" != ""  ]]; then 
 for d in $DEV_OK; do
 # смонтирован?
   if [[ "$(mount | awk '/'"${d}"'/')" = "" ]]; then
 # определим метку, если нет, то метка Nolabel
    l=$(udisks --show-info "/dev/${d}" 2>/dev/null | awk '/label:/ {print $2}')
    [[ -n "$l" ]] || l="Nolabel"
# формируем список для отображения
    echo "${l} (/dev/${d})" >> ${DEV_STR}
    COUNT=$(( ${COUNT} + 1))
   fi
 done


 if [ "${COUNT}" -gt "0" -a -r "${DEV_STR}" ]; then

  ans=$(cat "${DEV_STR}" | dmenu -sb '#525252' -p "Mount:" | awk '{ print $2 }' | tr -d ')(')
  [[ -z ${ans} ]] && exit_ "variable \"\$ans\" is null"

# монтируем с помощью udisks
  udisks --mount "${ans}" 2>&1 1>${ERR}
# проверяем результат операции монтирования
  OK=$(mount | grep "$ans")
   if [[ "${OK}" = ""  ]]; then 
# если плохо, рисуем оповещение с ошибкой
	 notify-send -i "${LOGO_ERR}" -t 5000 -u critical "$(cat ${ERR})" 
    else
# если все ОК, рисуем оповещение о результате
     notify-send -i "${LOGO_OK}" -t 5000 -u low "Mount \"${ans}\" succsessful!"
   fi
 fi 
else
 exit_ "Theris no device!"
fi

exit_ 0
