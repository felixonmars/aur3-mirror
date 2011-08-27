# Contributor: Aaron Robertson <rbb dot robertson at gmail dot com>

pkgname=ofc
pkgver=0.8.1
pkgrel=1
pkgdesc="A general-purpose Objective-C Class library"
arch=('i686 x86_64')
url="http://code.google.com/p/ofc"
license=('GPL')
provides=('libofc')
source=("http://ofc.googlecode.com/files/ofc-0.8.1.tar.gz")
sha1sums=('88fe19559cb9d13fe29a1a16180e82dfbb4bf872')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make prefix=$startdir/pkg/usr install
}

