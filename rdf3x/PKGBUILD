# Maintainer: Vianney le Clément <vleclement AT gmail · com>
pkgname=rdf3x
pkgver=0.3.5
pkgrel=1
pkgdesc="A RISC-style engine for RDF"
arch=('i686' 'x86_64')
url="http://www.mpi-inf.mpg.de/~neumann/rdf3x/"
license=('CCPL:by-nc-sa')
depends=('gcc-libs')
source=("http://www.mpi-inf.mpg.de/~neumann/rdf3x/$pkgname-$pkgver.tar.gz")
md5sums=('5fc0718a3460493616af88ad7b95c07b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make "CXXFLAGS=-O2"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  install bin/rdf3x{dump,load,query} "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
