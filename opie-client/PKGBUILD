# Maintainer: Abakus <java5@arcor.de>
# Contributor: Stefan J. Betz <info@stefan-betz.net>
pkgname=opie-client
pkgver=2.32
pkgrel=3
pkgdesc="S/KEY Client utilities"
arch=('i686' 'x86_64')
license=('GPL')
url="http://packages.debian.org/sid/opie-server"
source=("http://ftp.de.debian.org/debian/pool/main/o/opie/opie_$pkgver.dfsg.1.orig.tar.gz"
	"http://ftp.de.debian.org/debian/pool/main/o/opie/opie_$pkgver.dfsg.1-0.2.diff.gz")
md5sums=('fc269281acbb567839589aa46bce3335'
         '9c52858bd5d208bf983a6d0c16689f86')

build() {
	mkdir $pkgdir/etc
	mkdir -p $pkgdir/usr/share/man/man1
	mkdir -p $pkgdir/usr/share/man/man4
	cd $srcdir/opie-$pkgver.dfsg.1
	patch -p1 < ../opie_$pkgver.dfsg.1-0.2.diff
	./configure --enable-retype --prefix=$pkgdir/usr
	make client
	make client-install
	gzip --best opiekey.1 opie.4
	install opiekey.1.gz $pkgdir/usr/share/man/man1/opiekey.1.gz
	install opie.4.gz $pkgdir/usr/share/man/man4/opie.4.gz
}
