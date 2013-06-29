# Maintainer: lks <lukasgraetz [et] web [dot] de>
# Contributor: bountykiller <masse.nicolas@gmail.com>
pkgname=lite
pkgver=0.8.10
pkgrel=5
pkgdesc="The Lite gui library for the Directfb graphical library"
arch=(armv7h i686 x86_64)
url="http://www.directfb.org"
license="LGPL"
depends=('directfb')
source=(http://www.directfb.org/downloads/Libs/LiTE-${pkgver}.tar.gz
	lite_fix_stat_naming.patch
	lite_fix_pkgconfig.patch)
md5sums=('b9a28007d38c2b1c51ba1c3841df29ad'
         '26863d1b77a366cf7620d94ccb331623'
         '4712515e08a9d33241a0074c2524eee8')
prepare () {
	cd "LiTE-${pkgver}"
	patch -Np1 -i "${srcdir}/lite_fix_stat_naming.patch"
	patch -Np1 -i "${srcdir}/lite_fix_pkgconfig.patch"
}
build () {
	cd "LiTE-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "LiTE-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
