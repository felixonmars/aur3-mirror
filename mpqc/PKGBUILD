pkgname=mpqc
pkgver=2.3.1
pkgrel=1
pkgdesc="The Massively Parallel Quantum Chemistry Program computes properties of atoms and molecules using the time independent Schrödinger equation."
arch=('i686' 'x86_64')
url="http://www.mpqc.org/"
license=('GPL' 'LGPL')
depends=('lapack' 'gcc-fortran' 'gcc-libs' 'tk' 'perl')
source=(http://sourceforge.net/projects/mpqc/files/mpqc/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('2f9b4f7487387730d78066a53764f848')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make installroot="$pkgdir/" install
}
