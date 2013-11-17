# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnustep-terminal
_pkgname=Terminal
pkgver=0.9.8
pkgrel=1
pkgdesc="Terminal emulator application for GNUstep"
arch=('i686' 'x86_64')
url="http://gap.nongnu.org/terminal/index.html"
license=('GPL')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gcc-objc' 'gendesk' 'imagemagick')
source=(http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz)
md5sums=('e5ee38d17fc5d6840f3e6b167894d14b')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	convert $_pkgname.tiff $_pkgname.png
	gendesk -n -f --pkgname=$_pkgname --pkgdesc="Terminal emulator" --categories="System;TerminalEmulator"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	. /usr/share/GNUstep/Makefiles/GNUstep.sh
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 $_pkgname.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
	install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
