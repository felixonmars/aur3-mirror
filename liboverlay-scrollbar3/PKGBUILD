# Maintainer: Constantin Schomburg <me@xconstruct.net>

pkgname=liboverlay-scrollbar3
pkgver=0.2.13
_srcname=overlay-scrollbar
_pkgbranch=0.2
pkgrel=1
pkgdesc="Overlay scrollbar widget for GTK+ 3 (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="https://launchpad.net/ayatana-scrollbar"
license=('GPL')
depends=('gtk3-ubuntu')
conflicts=('liboverlay-scrollbar-bzr')
source=(http://launchpad.net/ayatana-scrollbar/$_pkgbranch/$pkgver/+download/$_srcname-$pkgver.tar.gz)
md5sums=('eb38a271783c2ab5b461bd2c961fe478')

build() {
  cd "$srcdir/$_srcname-$pkgver"
  ./configure --disable-static --prefix=/usr --sysconfdir=/etc --with-gtk=3
  make
}

package() {
	cd "$srcdir/$_srcname-$pkgver"
	make DESTDIR="$pkgdir" install
	rm "$pkgdir/etc/X11/Xsession.d/81overlay-scrollbar"
}
