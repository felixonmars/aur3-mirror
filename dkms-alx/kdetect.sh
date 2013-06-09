#!/bin/sh

for i in \
	`echo "linux linux-lts linux-ck linuxkernel26-ck linux-ck-corex linux-ck-p4 \
	linux-ck-pentm linux-ck-atom linux-ck-core2 linux-ck-nehalem  \
	linux-ck-ivybridge linux-ck-haswell linux-ck-kx linux-ck-k10 linux-ck-barcelona \
	linux-ck-bulldozer linux-ck-piledriver linux-ck-sandybridge"`;
do
	pacman -Qi ${i} &> /dev/null
	if [ "$?" = "0" ]; then
		_KVER=`LC_ALL=C pacman -Qi ${i} | grep Version | sed "s/.\+: //g"`

		_KTYPE=`echo ${i} | grep -o -e "ck\|lts"`
		
		case "${_KTYPE}" in
			"ck")
				export _KLIBVER=${_KVER}-ck
				;;
			"lts")
				export _KLIBVER=${_KVER}-LTS
				;;
			*)
				export _KLIBVER=${_KVER}-ARCH
				;;
		esac

		echo ${_KLIBVER}
	fi
done