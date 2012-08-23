# Maintainer: icoz <icoz.vt at gmail dot com>
pkgname=osmos-humblebundle
pkgver=1.6.1
pkgrel=2
pkgdesc="Arcade game, HumbleBundle version. 'Enter the ambient world of Osmos: elegant, physics-based gameplay, dreamlike visuals, and a minimalist, electronic soundtrack.'"
arch=('i686' 'x86_64')
url="http://www.humblebundle.com/"
license=('custom')
groups=('humblebundle')
depends=(openal)
makedepends=(unzip)
source=('osmos.desktop' 'icon.png')
md5sums=('a58df6802680a2898624ca76fa224bd3'
         'd40a2ca33c752d1198d1621ae8dab981')

#if [ "${CARCH}" = "x86_64" ]; then
_realname="Osmos"
_packagename="${_realname}_${pkgver}.tar.gz"
_archive_md5="ed2cb029c20c25de719c28062e6fc9cf"
_archive="${srcdir}/${_packagename}"

build() {
    #download archive if key is available
    if [ ! -f ${_archive} ] && [ -n "${_humblebundleandroid3key}" ]; then
        rm -f index.html\?key\=${_humblebundleandroid3key}*
        wget http://www.humblebundle.com/?key=${_humblebundleandroid3key}
        wget $(cat index.html\?key\=${_humblebundleandroid3key} | grep "${_packagename}" | cut -d "'" -f 10)
        mv ${_packagename}* ${_archive}
    fi

	#check game files
	if [ ! -f ${_archive} ]; then
		echo "
To install this you must own a copy of this game from ${url}."
		echo "Place ${_packagename} into ${srcdir}.
"
        echo "Alternatively you can add 'export _humblebundleandroid3key=<Your key here>' to ~/.bashrc if you want automated download ability. (You must restart your terminal for this to take effect)
"
		echo "Press ENTER to continue."
		read -a _unused
	fi
	if [ ! -f ${_archive} ]; then
		echo "${_archive} not found, exiting..."
		return 1
	fi
	if ! echo "${_archive_md5} ${_archive}" | md5sum -c --quiet; then
		echo "Invalid checksum for ${_archive}, exiting..."
		return 1
	fi

	#install all game files to /opt
	install -d ${pkgdir}/opt
	tar xvf ${_archive} -C ${pkgdir}/opt

	#install game icon
	install -D -m644 ${srcdir}/icon.png ${pkgdir}/opt/Osmos/

	#install application shortcut
	install -d ${pkgdir}/usr/share/applications
	install -D -m644 ${srcdir}/osmos.desktop ${pkgdir}/usr/share/applications/

	#install license
	install -d ${pkgdir}/usr/share/licenses/${pkgname}
	install -D -m644 ${pkgdir}/opt/Osmos/eula.txt ${pkgdir}/usr/share/licenses/${pkgname}/

	#remove unneeded files
	if [ "${CARCH}" = "x86_64" ]; then
		rm -rf ${pkgdir}/opt/Osmos/Osmos.bin32
	else
		rm -rf ${pkgdir}/opt/Osmos/Osmos.bin64
	fi
}
