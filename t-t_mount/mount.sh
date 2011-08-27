#!/bin/bash

link='/media/'
if [ "$1" == 1 ] && [ "$2" ]; then
	shift 1
	while [ "$1" ]; do
		fl=$(file "$1")
		if [[ "$fl" =~ 'symbolic link' ]]; then
			file=$(echo "$fl" | sed 's/.*\///' | sed "s/'//g")
			del=rm
			touch "/mnt/${file}.u"
			echo link
		else
			file="$1"
			del=rmdir
			touch "${file}.u"
		fi
		echo "$file"
		umount "/dev/disk/by-id/${file}"
		[ -e "/mnt/${file}" ] && rmdir "/mnt/${file}"
		[ -e "${file}" ] && rmdir "${file}"
		$del "$1"
		echo "$file"
		shift 1
	done
elif [ $1 == 'M' ]; then
	(
		cd /dev/disk/by-id
		for file in *; do
			if [ "$file" != '*' ] && [[ "$file" =~ ^usb- ]]; then
				echo "$file"
				ii=$(did "/dev/disk/by-id/$i")
				[ -e "/mnt/${file}" ] || mkdir "/mnt/${file}"
				mount "/dev/disk/by-id/${file}" "/mnt/${file}" -o uid=tom,codepage=852,iocharset=utf8 || mount "/dev/disk/by-id/${file}" "/mnt/${file}"
				[ -e "${link}${filen}" ] || ln -s "/mnt/${file}" "${link}${filen}"
				echo "$file"
			fi &
		done
	) | zenity --progress --auto-kill --auto-close --text 'Připojování vyměnitelných disků' --class focus-down
elif [ $1 == 'U' ]; then
	(
#		cd /dev/disk/by-id
#		for file in *; do
#			if [ "$file" == '*' ]; then
#				echo "$file"
#				touch "/mnt/${file}.u"
#				umount "/mnt/${file}"
#				[ -e "${link}${file}" ] && rm "${link}${file}"
#				[ -e "/mnt/${file}" ] && rmdir "/mnt/${file}"
#				echo "$file"
#			fi
#		done
		cd /mnt
		for file in *; do
			if [ "$file" != '*' ] && [ -d "$file" ]; then
				echo "$file"
				filen=$(did "/dev/disk/by-id/$file")
				touch "/mnt/${file}.u"
				umount "/mnt/${file}"
				[ -e "${link}${filen}" ] && rm "${link}${filen}"
				[ -e "/mnt/${file}" ] && rmdir "/mnt/${file}"
				echo "$file"
			fi
		done
	) | zenity --progress --auto-kill --auto-close --text 'Odpojování vyměnitelných disků' --class focus-down
elif [ $1 == 'E' ]; then
	(
		cd /dev
		for file in sd[qwertzuiopsdfghjklyxvnm]*; do
			[ "$file" == 'sd[qwertzuiopsdfghjklyxvnm]*' ] || (
				echo "$file"
				terminal -H -x lsof "/dev/${file}"
				echo "$file"
			)
		done
	) | zenity --progress --auto-kill --auto-close --text 'Chyby připojování vyměnitelných disků'
elif [ $1 == 'm' ]; then
	while [ 0 ]; do
		cd /dev/disk/by-id
		for file in *; do
			if [ "$file" != '*' ]; then
				if [ -e "/mnt/$file" ]; then
					echo "m:$file"
				elif [ -e "/mnt/$file.u" ]; then
					echo "u:$file"
				elif [[ "$file" =~ ^usb- ]]; then
					echo "$file"

					[ -e "/mnt/${file}" ] || mkdir "/mnt/${file}"
					mount "/dev/disk/by-id/${file}" "/mnt/${file}" -o uid=tom,codepage=852,iocharset=utf8 || mount "/dev/disk/by-id/${file}" "/mnt/${file}"
					[ -e "${link}${filen}" ] && rm "${link}${filen}"
#					mount | grep "${file} " && ln -s "/mnt/${file}" "${link}${file}"
#					ln -s "/mnt/${file}" "${link}${file}"
					echo "$file"
				fi
			fi
		done
		for i in `mount | grep '/mnt/' | sed '/ .*\|.*\// s///g'`; do
			ii=$(did "/dev/disk/by-id/$i")
			[ -e "${link}$ii" ] || ln -s "/mnt/$i" "${link}$ii"
		done
		cd /mnt
		for file in *; do
			if [ "$file" != '*' ]; then
				file=$(echo "${file}" | sed 's#\.u$##')
				if [ -e "/mnt/$file.u" ]; then
					filen=$(did "/dev/disk/by-id/$file")
					[ -e "/dev/disk/by-id/${file}" ] || (
						rm "/mnt/${file}.u"
						[ -e "${link}$filen" ] && rm "${link}$filen"
					)
				else
					[ -e "/dev/disk/by-id/$file" ] || (
						filen=$(did "/dev/disk/by-id/$file")
						umount "/mnt/$file"
						[ -e "${link}$filen" ] && rm "${link}$filen"
						rmdir "/mnt/$file"
					)
				fi
			fi
		done
		([ -e /dev/disk/by-id/usb-Nokia_S60_354225032709680-0:0 ] && ([ -e /dev/disk/by-id/usb-Nokia_S60_354225032709680-0:0-part1 ] || touch /dev/disk/by-id/usb-Nokia_S60_354225032709680-0:0)) &
		([ -e /dev/disk/by-id/usb-Nokia_S60_354225032709680-0:1 ] && ([ -e /dev/disk/by-id/usb-Nokia_S60_354225032709680-0:1-part1 ] || touch /dev/disk/by-id/usb-Nokia_S60_354225032709680-0:1)) &
		sleep 1
	done
fi
