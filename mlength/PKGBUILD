# Maintainer: Arathis <d.bierfeld@googlemail.com>
# Contributor: Dirk Bierfeld <d.bierfeld@googlemail.com>
pkgname=mlength
pkgver=1.00
pkgrel=1
pkgdesc="Simple script for showing the length of multiple video/audio files in a nice colored console output."
arch=(i686 x86_64)
url="http://www.foo.org"
license=('GPL')
depends=('midentify')
source=(mlength)
md5sums=('6d8a7c6e8b25d454dbd6199424906109')

build() {
	cd $srcdir
	mkdir $pkgdir/usr $pkgdir/usr/bin
	cp mlength $pkgdir/usr/bin
	chmod a+x $pkgdir/usr/bin/mlength
	return 0
}
