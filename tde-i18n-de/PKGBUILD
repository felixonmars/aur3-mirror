# Maintainer: ertua <mfl.34.qal@spamgourmet.com>
pkgname=tde-i18n-de
_pkgname=kde-i18n-de-trinity
pkgver=3.5.12_0debian+r1181027
_pkgver=3.5.12-0debian7+r1181027
pkgrel=1
pkgdesc="German internationalized files for TDE/Trinity"
arch=('any')
url="http://www.trinitydesktop.org/installation_lenny.php"
license=('GPL')
depends=(tde-tdelibs)
options=(!strip)
source=("http://depot-trinity.dotriver.eu/trinity/debian/pool/main/k/kde-i18n-trinity/${_pkgname}_${_pkgver}_all.deb")
noextract=("${_pkgname}_${_pkgver}_all.deb")
md5sums=('8cdd3d226e6430f293cc2c0dcf99c090')

build () {
	cd "${srcdir}"
	echo `pwd`
	ar x "${_pkgname}_${_pkgver}_all.deb" || return 1;
	tar -xzf data.tar.gz || return 1;
}

package () {
	mv "${srcdir}/opt" "${pkgdir}/opt"
}
