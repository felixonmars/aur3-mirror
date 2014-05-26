# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=libiodbc
pkgver=3.52.9
pkgrel=1
pkgdesc='Independent Open DataBase Connectivity for Linux'
arch=('i686' 'x86_64')
url="http://www.iodbc.org/dataspace/iodbc/wiki/iODBC/"
license=('LGPL')
depends=('sh')
makedepends=('chrpath')
source=("http://downloads.sourceforge.net/iodbc/${pkgname}-${pkgver}.tar.gz")
md5sums=('98a681e06a1df809af9ff9a16951b8b6')

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr \
		--disable-static \
		--includedir=/usr/include/libiodbc \
		--disable-gui \
        --disable-libodbc
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install

	chrpath -d ${pkgdir}/usr/bin/iodbctest{,w}
	rm -rf ${pkgdir}/usr/share/libiodbc/
}
