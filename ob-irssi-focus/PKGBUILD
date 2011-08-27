# Maintainer: Facundo Bianco (vando) <facundo{at}esdebian{dot}org>
pkgname=ob-irssi-focus
pkgver=1
pkgrel=0
pkgdesc="Irssi-like key+number to switch to a specific window"
arch=('i686' 'x86_64')
url="http://openbox.org/wiki/Help:IrssiStyleFocus"
license=('GPL')
depends=('openbox')
provides=("ob-irssi-focus")
source=(http://openbox.org/dist/tools/irssi-focus.c)
md5sums=('c00fcd870241c12e40ca6fb50d7830e7')

build() {
	cd ${srcdir}
	gcc -Wall -pedantic -o irssi-focus irssi-focus.c -lX11 `pkg-config --cflags --libs glib-2.0` -O2 -fno-strict-aliasing
	install -Dm755 irssi-focus $pkgdir/usr/bin/irssi-focus
}
