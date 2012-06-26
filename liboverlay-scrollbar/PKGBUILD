# Maintainer: Constantin Schomburg <me@xconstruct.net>

pkgname=liboverlay-scrollbar
pkgver=0.2.16
_srcname=overlay-scrollbar
_pkgbranch=0.2
pkgrel=1
pkgdesc="Overlay scrollbar widget for GTK+ 2 (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="https://launchpad.net/ayatana-scrollbar"
license=('GPL')
depends=('gtk2-ubuntu')
conflicts=('liboverlay-scrollbar-bzr')
source=(http://launchpad.net/ayatana-scrollbar/$_pkgbranch/$pkgver/+download/$_srcname-$pkgver.tar.gz)
md5sums=('a3ca0a8f81c18611a2330d57c3942733')

build() {
  cd "$srcdir/$_srcname-$pkgver"
  ./configure --disable-static --prefix=/usr --sysconfdir=/etc --with-gtk=2
  make
}

package() {
	cd "$srcdir/$_srcname-$pkgver"
	make DESTDIR="$pkgdir" install
	rm "$pkgdir/etc/X11/Xsession.d/81overlay-scrollbar"
}
