# Maintainer: Jason Hall <cakersq@gmail.com>
pkgname='thin-provisioning-tools'
pkgver=0.2.5
pkgrel=1
pkgdesc='A suite of tools for manipulating the metadata of the dm-thin device-mapper target.'
url='https://github.com/jthornber/thin-provisioning-tools'
license='GPL3'
source="https://github.com/jthornber/$pkgname/archive/v$pkgver.zip"
sha512sums=('e3345799839ddf52cea2b473d840386fa9c489ae5fc929b99a62f859c9ed2e30aa441719d8ebf04318993e77b3278f1c91143ebb49ee552d5c81d204915e1836')
arch=('i686' 'x86_64')
makedepends='boost'

prepare() {
	cd $srcdir/$pkgname-$pkgver
	autoreconf -i
}

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make install BINDIR=$pkgdir/usr/bin MANPATH=$pkgdir/usr/share/man
}

