# Maintainer: Ryan Holmes <ryan.xgamer99@gmail.com>

pkgname=libmicrohttpd-xbmc
pkgver=0.4.6
pkgrel=2
pkgdesc="a small C library that is supposed to make it easy to run an HTTP server as part of another application. For use with XBMC SVN (Dharma and above)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libmicrohttpd/"
license=('LGPL')
options=(!libtool)
depends=('gnutls')
provides=("libmicrohttpd=${pkgver}")
conflicts=('libmicrohttpd')
source=(ftp://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-$pkgver.tar.gz)
sha256sums=('0cb09e26678d1531a4fd40a748abff5142bfdad3ae11cfe3bb7ad7317a99e371')

build() {
	cd libmicrohttpd-${pkgver}
	./configure --prefix=/usr --disable-dependency-tracking --enable-largefile --enable-curl --enable-messages --with-pic
	make
}

package() {
	cd libmicrohttpd-${pkgver}
	make DESTDIR=${pkgdir} install
	install -Dm644 ${srcdir}/libmicrohttpd-${pkgver}/src/include/platform.h \
		${pkgdir}/usr/include/platform.h
	install -Dm644 ${srcdir}/libmicrohttpd-${pkgver}/src/include/plibc.h \
		${pkgdir}/usr/include/plibc.h
}
