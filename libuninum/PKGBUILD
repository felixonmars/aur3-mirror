# Maintainer: lolilolicon <lolilolicon_gmail_com>

pkgname=libuninum
pkgver=2.7
pkgrel=3
pkgdesc="C library for converting Unicode strings to integers and vice versa"
arch=('i686' 'x86_64')
url="http://billposer.org/Software/libuninum.html"
license=('LGPL')
depends=(gmp)
source=(http://billposer.org/Software/Downloads/$pkgname-$pkgver.tar.gz)
md5sums=('86bf829d4d9b1374f7577c4d812b108c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # Don't install the TCL interface.
  rm -f "$pkgdir"/usr/bin/NumberConverter.tcl

  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
