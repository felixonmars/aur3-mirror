# Maintainer: icoz <icoz.vt at gmail dot com>
pkgname=spirits-humblebundle
pkgver=1.0.0
pkgrel=2
pkgdesc="Arcade game, HumbleBundle version. 'Leaves fall, and spirits rise from the fallen leaves to begin their journey home.'"
arch=('i686' 'x86_64')
url="http://www.humblebundle.com/"
license=('custom')
groups=('humblebundle')
depends=(openal)
makedepends=(unzip)
source=('spirits.desktop' 'icon.png')
md5sums=('43446e522cf8cf0363872f31015777b9' '02914dcf17202a4bf3067d9ce088bac5')

#if [ "${CARCH}" = "x86_64" ]; then
_realname="spirits-linux"
_pkgrel="120719-1344640830"
_packagename="${_realname}-${pkgver}-${_pkgrel}.zip"
_archive_md5="900b03f85cdeb5a898b82fbbdc9fecb1"
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
	unzip ${_archive} -d ${pkgdir}/opt

	#install game icon
	install -D -m644 ${srcdir}/icon.png ${pkgdir}/opt/Spirits/

	#install application shortcut
	install -d ${pkgdir}/usr/share/applications
	install -D -m644 ${srcdir}/spirits.desktop ${pkgdir}/usr/share/applications/

	#install license
	install -d ${pkgdir}/usr/share/licenses/${pkgname}
	install -D -m644 ${pkgdir}/opt/Spirits/LICENSES.TXT ${pkgdir}/usr/share/licenses/${pkgname}/

	#remove unneeded files
	if [ "${CARCH}" = "x86_64" ]; then
		rm -rf ${pkgdir}/opt/Spirits/i686/
		rm -rf ${pkgdir}/opt/Spirits/x86_64/libopenal.so.1
		rm -rf ${pkgdir}/opt/Spirits/Spirits-32
	else
		rm -rf ${pkgdir}/opt/Spirits/x86_64/
		rm -rf ${pkgdir}/opt/Spirits/Spirits-64
		rm -rf ${pkgdir}/opt/Spirits/i686/libopenal.so.1
	fi
}
