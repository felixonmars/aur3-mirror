# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=flarps
pkgver=0.1.0
pkgrel=1
pkgdesc="A live text-based Jack MIDI arpeggiator"
arch=(i686 x86_64)
url="http://flarps.sourceforge.net/"
license=('GPL')
depends=('jack')
makedepends=('boost')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('5dc840ccbe14d7760187ff300dfca4ef')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
