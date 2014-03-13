# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=libmoe
pkgver=1.5.8
pkgrel=1
pkgdesc="Functions to handle multiple octets character encoding scheme"
arch=('i686' 'x86_64')
url="http://pub.ks-and-ks.ne.jp/prog/libmoe/"
license=('Public Domain')
depends=('glibc')
source=("http://pub.ks-and-ks.ne.jp/prog/pub/libmoe-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/libmoe-${pkgver}"
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/libmoe-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr MANDIR=/usr/share/man LIBEXECDIR=/usr/bin install
}

md5sums=('9a4a74f3b550e798bf528b804cc8517a')
