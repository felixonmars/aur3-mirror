#!/bin/bash

while [ $# != 0 ]; do
	if [[ "$1" =~ ^[1MUEm]$ ]]; then
		a=$1
	elif [[ "$1" =~ ^[-u]$ ]]; then
		uid=$2
		shift 1
	elif [[ "$1" =~ ^[-c]$ ]]; then
		cp=$2
		shift 1
	elif [[ "$1" =~ ^[-i]$ ]]; then
		ich=$2
		shift 1
	elif [[ "$1" =~ ^[-l]$ ]]; then
		test -d "$2" && link="$2"
		shift 1
	fi
	shift 1
done

test $uid || uid='root'
test $cp || cp=852
test $ich || ich=utf8
test $link || link='/media/'
export link
if [ "$a" == 1 ] && [ "$2" ]; then
	shift 1
	while [ "$a" ]; do
		fl=$(file "$a")
		if [[ "$fl" =~ 'symbolic link' ]]; then
			file=$(echo "$fl" | sed 's/.*\///' | sed "s/'//g")
			del=rm
			touch "/mnt/${file}.u"
			echo link
		else
			file="$a"
			del=rmdir
			touch "${file}.u"
		fi
		echo "$file"
		umount "/dev/disk/by-id/${file}"
		[ -e "/mnt/${file}" ] && rmdir "/mnt/${file}"
		[ -e "${file}" ] && rmdir "${file}"
		$del "$a"
		echo "$file"
		shift 1
	done
elif [ $a == 'M' ]; then
	(
		cd /dev/disk/by-id
		for file in *; do
			if [[ "$file" =~ ^wwn- ]]; then
				echo 0 > /dev/null
			elif [ "$file" != ata-ASUS_DRW-22B2ST ] && [ "$file" != ata-WDC_WD20EVDS-63T3B0_WD-WCAVY5955663 ] && [ "$file" != ata-WDC_WD20EVDS-63T3B0_WD-WCAVY5955663-part1 ] && [ "$file" != ata-WDC_WD3200AAJB-00TYA0_WD-WCAPZ4136683 ] && [ "$file" != ata-WDC_WD3200AAJB-00TYA0_WD-WCAPZ4136683-part1 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part1 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part2 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part3 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part4 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part5 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part6 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part7 ] && [ "$file" != dm-name-disk2 ] && [ "$file" != dm-name-disk427 ] && [ "$file" != dm-uuid-CRYPT-LUKS1-b8c3cdc814174711ae6380e8dd58cc7b-disk427 ] && [ "$file" != dm-uuid-CRYPT-LUKS1-ded60f2d52f0471cac7f83957afb0e76-disk2 ] && [ "$file" != scsi-SATA_WDC_WD20EVDS-63_WD-WCAVY5955663 ] && [ "$file" != scsi-SATA_WDC_WD20EVDS-63_WD-WCAVY5955663-part1 ] && [ "$file" != scsi-SATA_WDC_WD3200AAJB-_WD-WCAPZ4136683 ] && [ "$file" != scsi-SATA_WDC_WD3200AAJB-_WD-WCAPZ4136683-part1 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part1 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part2 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part3 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part4 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part5 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part6 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part7 ]; then
				echo "$file"
				ii=$(did "/dev/disk/by-id/$i")
				[ -e "/mnt/${file}" ] || mkdir "/mnt/${file}"
				mount "/dev/disk/by-id/${file}" "/mnt/${file}" -o uid=$uid,codepage=$cp,iocharset=$ich || mount "/dev/disk/by-id/${file}" "/mnt/${file}"
				[ -e "${link}${filen}" ] || ln -s "/mnt/${file}" "${link}${filen}"
				echo "$file"
			fi &
		done
	) | zenity --progress --auto-kill --auto-close --text 'Připojování vyměnitelných disků' --class focus-down
elif [ $a == 'U' ]; then
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
elif [ $a == 'E' ]; then
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
elif [ $a == 'm' ]; then
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
				elif [ "$file" != ata-ASUS_DRW-22B2ST ] && [ "$file" != ata-WDC_WD20EVDS-63T3B0_WD-WCAVY5955663 ] && [ "$file" != ata-WDC_WD20EVDS-63T3B0_WD-WCAVY5955663-part1 ] && [ "$file" != ata-WDC_WD3200AAJB-00TYA0_WD-WCAPZ4136683 ] && [ "$file" != ata-WDC_WD3200AAJB-00TYA0_WD-WCAPZ4136683-part1 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part1 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part2 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part3 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part4 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part5 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part6 ] && [ "$file" != ata-WDC_WD5000AVVS-63M8B0_WD-WCAV91654735-part7 ] && [ "$file" != dm-name-disk2 ] && [ "$file" != dm-name-disk427 ] && [ "$file" != dm-uuid-CRYPT-LUKS1-b8c3cdc814174711ae6380e8dd58cc7b-disk427 ] && [ "$file" != dm-uuid-CRYPT-LUKS1-ded60f2d52f0471cac7f83957afb0e76-disk2 ] && [ "$file" != scsi-SATA_WDC_WD20EVDS-63_WD-WCAVY5955663 ] && [ "$file" != scsi-SATA_WDC_WD20EVDS-63_WD-WCAVY5955663-part1 ] && [ "$file" != scsi-SATA_WDC_WD3200AAJB-_WD-WCAPZ4136683 ] && [ "$file" != scsi-SATA_WDC_WD3200AAJB-_WD-WCAPZ4136683-part1 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part1 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part2 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part3 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part4 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part5 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part6 ] && [ "$file" != scsi-SATA_WDC_WD5000AVVS-_WD-WCAV91654735-part7 ]; then
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
		([ -e /dev/disk/by-id/usb-Nokia_S60_354225032709680-0:0 ] && ([ -e /dev/disk/by-id/usb-Nokia_S60_354225032709680-0:0-part1 ] || touch /dev/disk/by-id/usb-Nokia_S60_354225032709680-0:0)) &
		([ -e /dev/disk/by-id/usb-Nokia_S60_354225032709680-0:1 ] && ([ -e /dev/disk/by-id/usb-Nokia_S60_354225032709680-0:1-part1 ] || touch /dev/disk/by-id/usb-Nokia_S60_354225032709680-0:1)) &
		sleep 1
	done
fi
