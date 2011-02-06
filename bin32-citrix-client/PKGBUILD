# Maintainer: LeeF <leef (at) hushmail (dot) com>
# Contributor: Scott <scottandchrystie (at) gmail (dot) com>
# Original Author: Andrwe <lord-weber-andrwe (at) renona-studios (dot) org>


pkgname=bin32-citrix-client
pkgver=11.100
pkgrel=11
pkgdesc="Provides XenApp(Citrix) for linux x86_64."
url="http://www.citrix.com"
arch=('x86_64')
license=('CAL')
depends=('gtk2' 'lib32-gcc-libs' 'lib32-libjpeg' 'lib32-libpng' 'lib32-libvorbis' 'lib32-libx11' 'lib32-libxaw' 'lib32-libxext' 'lib32-libxft' 'lib32-libxinerama' 'lib32-libxmu' 'lib32-libxp' 'lib32-libxpm' 'lib32-libxt' 'lib32-openmotif' 'lib32-printproto' 'xextproto')
source=('http://www.citrix.com//English/SS/downloads/EULA_p.asp?downloadID=3323&versionID=1862392&productID=186')
install=citrix-client.install
md5sums=('069bb3337791b0b55cbbf666c95403e5')

build() {

	instdir="/usr/lib32/ICAClient"
	# Create folder structure
	install -d "${pkgdir}${instdir}"
	install -d "${pkgdir}"/usr/lib/mozilla/plugins
	install -d "${pkgdir}"/usr/bin/

	# copy needed files
	cp -r ./linuxx86/linuxx86.cor/* "${pkgdir}${instdir}"/
	cp ./setupwfc "${pkgdir}${instdir}"/

	# Go to package directory
	cd "${pkgdir}${instdir}"/

	# Create executable wrapper for the binaries
	echo -e "#!/bin/sh\nexport ICAROOT=${instdir}\nexport GCONV_PATH=/usr/lib32/gconv/\n\${ICAROOT}/wfica -file \"\$1\"" > ./wfica.sh
	echo -e "#!/bin/sh\nexport ICAROOT=${instdir}\nexport GCONV_PATH=/usr/lib32/gconv/\n\${ICAROOT}/wfica -associate -fileparam \"\$1\"" > ./wfica_assoc.sh
	cp ./wfica.sh "${pkgdir}"/usr/bin/wfica
	cp ./wfica_assoc.sh "${pkgdir}"/usr/bin/wfica_assoc
	chmod 755 ${pkgdir}/usr/bin/{wfica,wfica_assoc}
	chmod 755 ./{wfica.sh,wfica_assoc.sh}
	
	# Create symlinks for the Npica.ad binary
	ln -s ./nls/en/Npica.ad ./Npica.ad
	ln -s ./Npica.ad ./Npica

	# Copy program inforamtion files to program root directory
	cp ${srcdir}/nls/en/{eula.txt,install.txt,readme.txt} ./

	# Copy default configuration files to config directory of the program and setting them readable
	cp ./nls/en/{appsrv.ini,wfclient.ini,module.ini} ./config/
	chmod 666 ./config/{appsrv.ini,wfclient.ini,module.ini}
	chmod 777 ./config

	# Copy Firefox plugin into plugin directory
	cp ./npica.so "${pkgdir}"/usr/lib/mozilla/plugins/
	
}

