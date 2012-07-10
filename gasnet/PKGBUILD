# Maintainer: Filippo Squillace feel.squally at gmail.com
pkgname=gasnet
pkgver=1.18.2
pkgrel=1
pkgdesc="GASNet is a language-independent, low- level networking layer that provides network-independent, high-performance communication primitives tailored for implementing parallel global address space SPMD languages such as UPC, Titanium, and Coarray Fortran"
url="http://gasnet.cs.berkeley.edu/"
license=("GPL")
arch=(any)
depends=()
options=()
source=(http://gasnet.cs.berkeley.edu/GASNet-${pkgver}.tar.gz)
md5sums=('b6ce86d33f16c83e915729e9c591cf7e')
build() {
 
  cd "$srcdir/GASNet-${pkgver}"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${startdir}/pkg" install || return 1
}

