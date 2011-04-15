# Maintainer: Qi Wenmin <qiwenmin@gmail.com>, Mat <matlinuxer2@gmail.com>
pkgname=libucimf
pkgver=2.3.8
pkgrel=1
pkgdesc="Unicode Console InputMethod Framework - an input plugin under Framebuffer Console environment."
arch=("i686" "x86_64")
license=('GPL')
url="http://code.google.com/p/ucimf/"
depends=('freetype2' 'fontconfig' 'libtool')
source=("http://ucimf.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('2f754d4811cfa5ab744debe16ac514b7')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc
	make || return 1
	make DESTDIR=${startdir}/pkg install || return 1
}
