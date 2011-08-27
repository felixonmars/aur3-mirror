# Maintainer: Hubert Maraszek <marach5 at gmail dot com>
pkgname=heroes-data
pkgver=1.5
pkgrel=1
pkgdesc="An advanced Nibbles clone"
arch=('any')
url="http://heroes.sourceforge.net/"
license=('GPL')
source=(http://prdownloads.sourceforge.net/heroes/$pkgname-$pkgver.tar.gz)
md5sums=('1a53e23b007f526a76df8bef97a41550')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
