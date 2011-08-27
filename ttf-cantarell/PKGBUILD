# Maintainer: H.Gökhan Sarı <hsa2@difuzyon.net>
pkgname=ttf-cantarell
pkgver=20090717
pkgrel=1
pkgdesc="A font family designed by Dave Crossland"
arch=(any)
url="http://abattis.org/cantarell/"
license=('GPL')
makedepends=('unzip')
install=$pkgname.install
source=('http://abattis.org/cantarell/Cantarell-2009-07-17.zip')
md5sums=('c97c000a4084bed7108f4c75eae657c0')

build() {
  mkdir -p "$pkgdir/usr/share/fonts/TTF"
}

package() {
  cd "$srcdir/Cantarell"

  cp *.ttf "$pkgdir/usr/share/fonts/TTF"
}

# vim:set ts=2 sw=2 et:
