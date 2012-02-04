# Maintainer: josephgbr <rafael.f.f1 at gmail dot com>

_pkgbasename=cloog
pkgname=lib32-$_pkgbasename-ppl
pkgver=0.16.1
pkgrel=1
pkgdesc="Library that generates loops for scanning polyhedra (32 bit)"
arch=('i686' 'x86_64')
url="http://www.cloog.org/"
license=('GPL')
depends=('lib32-ppl>=0.11' 'lib32-gmp')
makedepends=('gcc-multilib')
options=('!libtool')
source=("http://www.bastoul.net/cloog/pages/download/cloog-parma-$pkgver.tar.gz")
md5sums=('f483539b30a60a3478eea70c77b26bef')

build() {
  cd $srcdir/cloog-parma-$pkgver

  ./configure --prefix=/usr --includedir=/usr/include/cloog-ppl \
    --with-bits=gmp --with-ppl=/usr --libdir=/usr/lib32 CC='gcc -m32'
  make
}

check() {
  cd $srcdir/cloog-parma-$pkgver
  make check
}

package() {
  cd $srcdir/cloog-parma-$pkgver
  make DESTDIR=$pkgdir/ install
  rm -rf $pkgdir/usr/{bin,include}
}
