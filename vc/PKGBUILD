# Maintainer: PedsXing <pedsxing at gmx dot net>
pkgname=vc
pkgver=0.6.1
pkgrel=1
pkgdesc="portable, zero-overhead SIMD library for C++"
url="http://code.compeng.uni-frankfurt.de/projects/vc/"
arch=('x86_64' 'i686')
license=('LGPLv3')
makedepends=('cmake')
conflicts=('vc-git')
source=("http://code.compeng.uni-frankfurt.de/attachments/download/147/Vc-${pkgver}.tar.gz")
md5sums=('8b9885b58872a11131d2818ec54f838a')
 
build() {
  cd "$srcdir/Vc-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make
}

check() {
  cd "$srcdir/Vc-$pkgver"
  make test
}

package() {
  cd "$srcdir/Vc-$pkgver"
  make DESTDIR="$pkgdir/" install
}

