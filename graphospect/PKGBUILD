# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=graphospect
pkgver=1.1
pkgrel=1
pkgdesc="A program to embed images into sound files, it creates a .wav file whose spectograph matches the input .ppm file."
arch=(i686 x86_64)
url="http://d00m.org/~someone/graphospect/"
license=('GPL')
depends=('glibc')
source=("$url$pkgname.tar.gz")
md5sums=('2a533fa0600308a98ea7b4abb9bbab28')

build() {
  cd "$srcdir/graph-o-spect"

  make
}

package() {
  cd "$srcdir/graph-o-spect"

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
