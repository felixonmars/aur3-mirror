# Maintainer: Abakus <java5@arcor.de>
# Contributor: Stefan J. Betz <info@stefan-betz.net>
pkgname=opie-server
pkgver=2.32
pkgrel=2
pkgdesc="S/KEY Server utilities"
arch=('i686' 'x86_64')
license=('GPL')
url="http://packages.debian.org/sid/opie-server"
backup=('etc/opiekeys')
source=("http://ftp.de.debian.org/debian/pool/main/o/opie/opie_$pkgver.dfsg.1.orig.tar.gz"
	"http://ftp.de.debian.org/debian/pool/main/o/opie/opie_$pkgver.dfsg.1-0.2.diff.gz")
md5sums=('fc269281acbb567839589aa46bce3335'
         '9c52858bd5d208bf983a6d0c16689f86')

build() {
	mkdir $pkgdir/etc
	mkdir -p $pkgdir/usr/share/man/man1
	mkdir -p $pkgdir/usr/share/man/man5
	cd $srcdir/opie-$pkgver.dfsg.1
	patch -p1 < ../opie_$pkgver.dfsg.1-0.2.diff
	./configure --enable-retype --prefix=$pkgdir/usr
	make server
	make server-install KEY_FILE=$pkgdir/etc/opiekeys LOCK_DIR=$pkgdir/etc/opielocks
	gzip --best opiepasswd.1 opieinfo.1 opiekeys.5
	install opieinfo.1.gz $pkgdir/usr/share/man/man1/opieinfo.1.gz
	install opiepasswd.1.gz $pkgdir/usr/share/man/man1/opiepasswd.1.gz
	install opiekeys.5.gz $pkgdir/usr/share/man/man5/opiekeys.5.gz
}
