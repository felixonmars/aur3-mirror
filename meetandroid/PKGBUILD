# Maintainer: Roberto Catini <roberto.catini@gmail.com>
pkgname=meetandroid
pkgver=3
pkgrel=1
pkgdesc="A library for connecting an Arduino microcontroller with an Android device via bluetooth"
arch=('any')
url="http://www.amarino-toolkit.net/"
license=('GPL3')
depends=('arduino')
source=(http://amarino.googlecode.com/files/MeetAndroid_$pkgver.zip)
md5sums=('7f60ea8ee068da228f0f164d5ee68b75')

package() {
	mkdir -p $pkgdir/usr/share/arduino/libraries
	cp -r $srcdir/MeetAndroid $pkgdir/usr/share/arduino/libraries
}
