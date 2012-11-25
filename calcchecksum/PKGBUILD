# Contributor: Mladen Pejaković <pejakm@gmail.com>
# Contributor: kotyz <kotyz.king@gmail.com>

pkgname=calcchecksum
pkgver=1.6
pkgrel=2
pkgdesc="A small checksum (hash) calculator for KDE 3.x"
arch=('i686' 'x86_64')
url="http://calcchecksum.sourceforge.net/"
license=('GPL')
depends=('kdelibs3')
makedepends=('qt3')
source=(http://pejakm.googlepages.com/$pkgname-$pkgver-pre1.tar.bz2)
md5sums=('0194681fe0ee0e30d7a9083e6597cbb2')

build() {
  cd "$srcdir/$pkgname-$pkgver-pre1"
  ./configure
  make || return 1
  make DESTDIR="$pkgdir" install
}
