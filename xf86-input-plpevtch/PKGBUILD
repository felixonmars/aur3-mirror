# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=xf86-input-plpevtch
pkgver=0.5.0
pkgrel=1
pkgdesc="Eventdevice driver for touchscreens under Xorg 7.x"
arch=('i686' 'x86_64')
url="http://www.plop.at/en/touchscreen.html"
license=('GPL')
depends=('xf86-input-evtouch' 'xorg-server')
source=(http://download.plop.at/files/plpevtch/$pkgname-$pkgver.tar.gz)
md5sums=('5dcafc10b102f80ea10c28c2c1552e7c')

build() {
 cd "$srcdir/$pkgname-$pkgver"
 ./configure --prefix=/usr
 make
}

package() {
 cd "$srcdir/$pkgname-$pkgver"
 make DESTDIR="$pkgdir/" install
 rm "$pkgdir/usr/include/xorg/evdev-properties.h"
}
