# Maintainer: A.T.W.A. <arch.atwa@gmail.com>

pkgname=japw
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple image viewer"
arch=('i686' 'x86_64')
url="http://tima-s.narod.ru/programs/japw"
license=('GPL')
depends=('gtk2')
source=(http://tima-s.narod.ru/programs/japw/$pkgname.tar.gz)
md5sums=('ac18b2960ec04644059e84a3d89d64b1')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  make DESTDIR="$pkgdir" PREFIX=usr install
}
