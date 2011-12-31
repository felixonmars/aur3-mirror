# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=esnc
pkgver=1.0
pkgrel=1
pkgdesc="A fork of Ersatz Emacs, the smallest of the microEmacs forks."
arch=(i686 x86_64)
url="http://essence.tuxfamily.org/"
license=('GPL')
depends=('ncurses')
source=($url$pkgname-$pkgver.tar.bz2)
md5sums=('1343db23bd226a7ebcf19fe6edbd04ac')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # link against ncurses
  sed -i 's/termcap/ncursesw/' Makefile

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # bin
  install -Dm755 $pkgname \
    "$pkgdir/usr/bin/$pkgname"

  # keys
  install -Dm644 Essence.keys \
    "$pkgdir/usr/share/$pkgname/Essence.keys"

  # man
  install -Dm644 $pkgname.1 \
    "$pkgdir/usr/share/man/man1/$pkgname.1"
}

# vim:set ts=2 sw=2 et:
