# Contributor: Johannes Zellner <webmaster@nebulon.de>
pkgname=livepause
pkgver=1.0
pkgrel=1
pkgdesc="livepause application for the dvbstreamer."
arch=('i686')
url="http://sourceforge.net/projects/dvbstreamer/"
license=('GPL')
depends=('dvbstreamer')
source=(http://downloads.sourceforge.net/dvbstreamer/$pkgname-$pkgver.tar.bz2)
md5sums=('ae5233c7ab90553271423fb909110804')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
