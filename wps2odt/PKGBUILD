# Maintainer: Robert McCathie <archaur at rmcc dot com dot au>

pkgname=wps2odt
pkgver=0.2.0
pkgrel=1
pkgdesc="a Microsoft Works Word Processor file to OpenDocument Text file converter"
arch=('i686' 'x86_64')
url="http://libwps.sourceforge.net/"
license=('LGPL')
depends=('libwps>=0.2.0')
source=("http://downloads.sourceforge.net/project/libwps/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('32c91f7b1f241ad96154643b046fd264')

build() {
	cd "$srcdir"/"$pkgname"-"$pkgver"
	./configure --sysconfdir=/etc --prefix=/usr || return 1
	make || return 1
	make DESTDIR="$pkgdir" install || return 1
}
