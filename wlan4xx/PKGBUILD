pkgname=wlan4xx
pkgver=0.2.0
pkgrel=1
pkgdesc="Program to recovery keys of WLANxxxxxx, YaCOMxxxxxxx and WiFixxxxxx."
url="http://www.seguridadwireless.net/"
license=('GPL')
arch=('i686' 'x86_64')
source=(http://www.seguridadwireless.net/archivos/${pkgname}-${pkgver}.tar.gz)
md5sums=('e63d1af67440a3859375b415a9c30f7b')

build()
{
	cd ${srcdir}/${pkgname}-${pkgver}
	make clean || return 1
	make || return 1
	install -D -m755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/usr/sbin/${pkgname}
}
