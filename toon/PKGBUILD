#

pkgname=toon
pkgver=2.2
pkgrel=1
pkgdesc="Tom's Object-oriented numerics library is a C++ numerics library which is designed to operate efficiently on large numbers of small matrices, and provides easy access to a number of algorithms including matrix decompositions and optimizations."
url="http://www.edwardrosten.com/cvd/toon.html"
arch=('x86_64' 'i686')

license=('BSD')
depends=('lapack' 'blas')
optdepends=()
makedepends=('gcc>=4.3.0')
conflicts=()
replaces=()
backup=()
#install='TooN.install'
source=("http://www.edwardrosten.com/cvd/TooN-${pkgver}.tar.xz")
md5sums=('769ccb5f2361c39b3fd2922dfe9cff46')


build() {
  cd "${srcdir}/TooN-${pkgver}"
  ./configure --prefix=/usr
  make
}
 
package() {
  cd "${srcdir}/TooN-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/pkgconfig"
  make DESTDIR="${pkgdir}" pkgconfig="${pkgdir}/usr/lib/pkgconfig" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
