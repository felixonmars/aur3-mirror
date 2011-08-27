# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=BookMoocher
pkgname=bookmoocher
pkgver=0.0.6
pkgrel=1
pkgdesc="A simple program that helps you keep informed on new books available on bookmooch.com."
arch=(i686 x86_64)
url="http://bluenine.it/bookmoocher/"
license=('custom:AS IS')
depends=('qt')
install="$pkgname.install"
source=("$url$_pkg-$pkgver-src.tgz"
        "$pkgname.desktop"
        "$pkgname.png")
md5sums=('7ff440e4daf896a46dc8bd12be76740a'
         '84376608715b4b12b7bd6eb8e231e53c'
         '6c987832c309841f3d451858b320635e')

build() {
  cd "$srcdir/$_pkg-$pkgver-src"

  qmake
  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver-src"

  # bin
  install -Dm755 $_pkg "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # desktop
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 ../$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
