# Maintainer: Roberto Catini <roberto.catini@gmail.com>
pkgname=tm1638
pkgver=2.0.1
pkgrel=1
pkgdesc="A library for connecting a TM1638/TM1640 to arduino"
arch=('any')
url="http://code.google.com/p/tm1638-library/"
license=('GPL3')
depends=('arduino')
source=("http://tm1638-library.googlecode.com/files/TM1638%20Library%20v$pkgver.zip")
md5sums=('fce733ef38c42d9bbf27ef6fcfd5353f')

package() {
	mkdir -p $pkgdir/usr/share/arduino/libraries
	cp -r $srcdir/TM1638 $pkgdir/usr/share/arduino/libraries
}
