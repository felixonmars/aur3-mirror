# Maintainer: Trương Xuân Tính <xuantinh@gmail.com>
pkgname=scim-unikey
pkgver=0.3.1
pkgrel=1
pkgdesc="Scim module for Vietnamese Keyboard"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://code.google.com/p/scim-unikey/"
source=($pkgname-$pkgver.tar.gz)
md5sums=('8113d7f4f754ff59df987969c29ad8fc')
depends=('scim')
optdepends=('scim-bridge')
install=${pkgname}.install

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR="$pkgdir" install || return 1
}
