# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=libopie
pkgver=2.32
pkgrel=1
pkgdesc="S/KEY Library"
arch=('i686' 'x86_64')
license=('GPL')
url="http://packages.debian.org/sid/opie-server"
source=("http://ftp.de.debian.org/debian/pool/main/o/opie/opie_$pkgver.dfsg.1.orig.tar.gz"
	"http://ftp.de.debian.org/debian/pool/main/o/opie/opie_$pkgver.dfsg.1-0.2.diff.gz")
md5sums=('fc269281acbb567839589aa46bce3335'
         '9c52858bd5d208bf983a6d0c16689f86')

build() {
	mkdir -p $pkgdir/usr/lib $pkgdir/usr/include
	cd $srcdir/opie-$pkgver.dfsg.1
	patch -p1 < ../opie_$pkgver.dfsg.1-0.2.diff
	./configure --enable-retype --prefix=$pkgdir/usr
	make libopie/libopie.a
	install -m0644 opie.h $pkgdir/usr/include
	install libopie/libopie.a $pkgdir/usr/lib
}
