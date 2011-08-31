#!/bin/bash

if [[ "$*" =~ --setup ]]; then
	echo 'Umount all removables devices and press enter continue.'
	read
	nv=$(dir /dev/disk/by-id | sed '/^wwn-/d')
	nv=$(
		echo -n '			elif '
		for nvz in $nv; do
			echo -n '[ "$file" != '
			echo -n "$nvz"
			echo -n ' ] && '
		done | sed 's/ && $/; then #øø/'
	)
	sed "/			elif .*; then #øø/ s//$nv/g" /usr/bin/mount.sh
	exit 0
elif [[ "$*" =~ (-h|--help) ]]; then
	echo 'Parametr	Action'
	echo '-u		user'
	echo '-c		filesystem coding'
	echo '-i		system coding'
	echo '-l		folder with links'
	echo '1		umount folders'
	echo 'M		mount all'
	echo 'U		umount all'
	echo 'm		auto mounting'
fi
while [ $# != 0 ]; do
	if [[ "$1" =~ ^[1MUEm]$ ]]; then
		a=$1
	elif [[ "$1" =~ ^-u$ ]]; then
		uid=$2
		shift 1
	elif [[ "$1" =~ ^-c$ ]]; then
		cp=$2
		shift 1
	elif [[ "$1" =~ ^-i$ ]]; then
		ich=$2
		shift 1
	elif [[ "$1" =~ ^-l$ ]]; then
		test -d "$2" && link="$2"
		shift 1
	else
		if [ "$jedna" ]; then
			jdn=$(echo "$1" | sed 's/ /____/g')
			jedna="$jedna $jdn"
		else
			jedna=$(echo "$1" | sed 's/ /____/g')
		fi
	fi
	shift 1
done

test "$uid" || uid='root'
test "$cp" || cp=852
test "$ich" || ich=utf8
test "$link" || link='/media/'
export link
if [ "$a" == 1 ] && [ "$jedna" ]; then
	for b in $jedna; do
		b=$(echo "$b" | sed 's/____/ /g')
		fl=$(file "$b")
		if [[ "$fl" =~ 'symbolic link' ]]; then
			file=$(echo "$fl" | sed 's/.*\///' | sed "s/'//g")
			del=rm
			touch "/mnt/${file}.u"
			echo link
		else
			file="$b"
			del=rmdir
			touch "${file}.u"
		fi
		echo "$file"
		umount "/dev/disk/by-id/${file}"
		[ -e "/mnt/${file}" ] && rmdir "/mnt/${file}"
		[ -e "${file}" ] && rmdir "${file}"
		$del "$b"
		echo "$file"
	done
elif [ "$a" == 'M' ]; then
	(
		cd /dev/disk/by-id
		for file in *; do
			if [[ "$file" =~ ^wwn- ]]; then
				echo 0 > /dev/null
			elif [ "$file" ]; then #øø
				echo "$file"
				ii=$(did "/dev/disk/by-id/$i")
				[ -e "/mnt/${file}" ] || mkdir "/mnt/${file}"
				mount "/dev/disk/by-id/${file}" "/mnt/${file}" -o uid=$uid,codepage=$cp,iocharset=$ich || mount "/dev/disk/by-id/${file}" "/mnt/${file}"
				[ -e "${link}${filen}" ] || ln -s "/mnt/${file}" "${link}${filen}"
				echo "$file"
			fi &
		done
	) | zenity --progress --auto-kill --auto-close --text 'Připojování vyměnitelných disků' --class focus-down
elif [ "$a" == 'U' ]; then
	(
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
elif [ "$a" == 'm' ]; then
	while [ 0 ]; do
		cd /dev/disk/by-id
		for file in *; do
			if [ "$file" != '*' ]; then
				if [[ "$file" =~ ^wwn- ]]; then
					echo 0 > /dev/null
				elif [ -e "/mnt/$file" ]; then
					echo "m:$file"
				elif [ -e "/mnt/$file.u" ]; then
					echo "u:$file"
				elif [ "$file" ]; then #øø
					echo "$file"
					[ -e "/mnt/${file}" ] || mkdir "/mnt/${file}"
					mount "/dev/disk/by-id/${file}" "/mnt/${file}" -o uid=$uid,codepage=$cp,iocharset=$ich || mount "/dev/disk/by-id/${file}" "/mnt/${file}"
					[ -e "${link}${filen}" ] && rm "${link}${filen}"
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
		sleep 1
	done
fi
