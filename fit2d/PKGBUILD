# Maintainer: Army (uli dot armbruster at google)

pkgname=fit2d
pkgver=12.081
_pkgver=12_081
pkgrel=1
pkgdesc="a program system for highly efficient reconstruction of tomography data using the back-projection method"
arch=('i686' 'x86_64')
url="http://www.esrf.eu/computing/scientific/FIT2D/"
license=('custom')
source=(http://ftp.esrf.eu/pub/expg/FIT2D/${pkgname}_${_pkgver}_i686_linux2.4.20)
if [ "${CARCH}" = 'i686' ]; then
	depends=('gcc-libs' 'libx11')
elif [ "${CARCH}" = 'x86_64' ]; then
	depends=('lib32-gcc-libs' 'lib32-libx11')
fi

#build() {
#	/bin/true
#}

package() {
	install -Dm755 ${srcdir}/${pkgname}_${_pkgver}_${arch}_linux2.4.20 ${pkgdir}/usr/bin/${pkgname}
}
md5sums=('31826ff3dfa6c7f655e086cf7e38510f')
