# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=svglines
pkgver=1.0
pkgrel=2
pkgdesc="A program to convert raster images to sketchy looking vector images."
arch=(i686 x86_64)
url="http://d00m.org/~someone/svglines/"
license=('GPL')
depends=('glibc')
source=("$url$pkgname.tar.gz")
md5sums=('fed9b048924c01625e32dc275ecf1860')

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"

  # bin
  install -Dm755 $pkgname \
    "$pkgdir/usr/bin/$pkgname"

  # readme
  install -Dm644 README \
    "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
