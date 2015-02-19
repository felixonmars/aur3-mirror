# Maintainer: Franziskus Kiefer <arch at franziskuskiefer dot de>
pkgname=pbc
pkgver=0.5.14
pkgrel=1
pkgdesc="The Pairing-Based Cryptography Library"
arch=('i686' 'x86_64')
url="http://crypto.stanford.edu/pbc/"
license=('GPL')
source=(http://crypto.stanford.edu/pbc/files/$pkgname-$pkgver.tar.gz)
sha256sums=('772527404117587560080241cedaf441e5cac3269009cdde4c588a1dce4c23d2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  LDFLAGS=-lgmp ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
