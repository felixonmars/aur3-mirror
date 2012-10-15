# Maintainer: Martynas Januskauskas <martynas@januskauskas.eu>
pkgname=flightgear-aircraft
pkgver=2
pkgrel=8
pkgdesc="Flightgear aircraft download script"
arch=('x86_64' 'i686')
url="http://www.flightgear.org/download/aircraft-v2-8/"
license=('Unknown')
groups=()
if [ "$(pacman -Qs flightgear-git)" != "" ]; then
depends=('flightgear-git' 'fgdata-git' 'wget' 'unzip')
else
depends=('flightgear' 'flightgear-data' 'wget' 'unzip')
fi
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
noextract=()

build() {
	# create dirs
	cd ${srcdir}/
	mkdir -p ${pkgdir}/usr/bin/

	# create script
	echo "#!/bin/sh

	filename=\"/tmp/flightgear_aircraft_2.8.html\"
	tmpfile=\"flightgear_aircraft_2.8.tmp\"
	fg_aircraft_dir=\"/usr/share/FlightGear/data/Aircraft\"

	echo 'Downloading aircraft list...'
	if [ -f \$filename ];
	then
	echo \"Aircraft list found, not redownloading.\"
	else
	wget http://www.flightgear.org/download/aircraft-v2-8/ -O \$filename
	fi

	echo \"Enter full or partial (regexp) name of aircraft (leave empty for all aircraft): \"
	read -e aircraft

	if [ \"\$aircraft\" == \"\" ]
	then
		echo \"Downloading all\"
		lines=\`grep -oiE \"href=\\\"(.*?).zip(.*?)Mirror 1\"  \$filename\`
	else
		lines=\`grep -oiE \"href=\\\"(.*?)\$aircraft(.*?).zip(.*?)Mirror 1\"  \$filename\`
	fi

	for i in \${lines[@]}
	do
		if [ \$i == \"1\" ]
		then
			continue
		fi
	
		if [ \"\$aircraft\" == \"\" ]
		then
			pos=\`expr index \"\$i\" 'href'\`
		else
			pos=\`expr index \"\$i\" \$aircraft\`
		fi

		if [ \$pos != 0 ]
		then
			link=\${i#'href=\"'}
			link=\${link%'\">[Mirror'}
			echo \"Downloading \$link\"
			wget \$link -O \$fg_aircraft_dir/\$tmpfile
			cd \$fg_aircraft_dir
			unzip \$fg_aircraft_dir/\$tmpfile
			rm \$fg_aircraft_dir/\$tmpfile
		fi
	done" >> ${pkgdir}/usr/bin/flightgear_aircraft
	
	# set permissions
	chmod 0755 ${pkgdir}/usr/bin/flightgear_aircraft
}