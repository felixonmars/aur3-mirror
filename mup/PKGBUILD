# Maintainer: Arkkra Enterprises <support at arkkra dot com>
pkgname=mup
pkgver=6.2
pkgrel=1
epoch=
pkgdesc="music publisher, creates PostScript printed music or MIDI"
arch=('i686' 'x86_64')
url='http://www.arkkra.com'
license=('custom:BSD-like')
groups=()
depends=('fltk' 'libxpm')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=whatsnew.html
source=(ftp://ftp.arkkra.com/pub/unix/mup62src.tar.gz)
noextract=()
md5sums=('36653dd187f5521a3a581be78d04bf7b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

check() {
	:
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i -e "/packages/s:doc/packages/:doc/:" makefile
	make DESTDIR="$pkgdir/" install
	mkdir -p $pkgdir/usr/share/licenses/mup
	mv $pkgdir/usr/share/doc/mup/license.txt $pkgdir/usr/share/licenses/mup/LICENSE
}
