# Maintainer: Roberto Catini <roberto.catini@gmail.com>
pkgname=ht1632-git
pkgver=2.0.1
pkgrel=1
pkgdesc="A powerful library that allows an Arduino to interface with the popular Holtek LED driver"
arch=('any')
url="https://github.com/gauravmm/HT1632-for-Arduino"
license=('custom')
depends=('arduino')

package() {
	git clone https://github.com/gauravmm/HT1632-for-Arduino.git $pkgname --depth=1
	install -D -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd $srcdir/$pkgname/Arduino
	mkdir -p $pkgdir/usr/share/arduino/libraries
	cp -r HT1632 $pkgdir/usr/share/arduino/libraries
	cp -r Sample $pkgdir/usr/share/arduino/libraries/examples
}
