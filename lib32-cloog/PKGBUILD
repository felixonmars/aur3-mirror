# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=cloog
pkgname=lib32-${_pkgbase}
pkgver=0.18.0
pkgrel=1
pkgdesc="Library that generates loops for scanning polyhedra (32 bit)"
arch=('x86_64')
url="http://www.bastoul.net/cloog/"
license=('GPL')
depends=('lib32-isl' "${_pkgbase}")
conflicts=('lib32-cloog-ppl')
source=($url/pages/download/$_pkgbase-$pkgver.tar.gz
        cloog-0.18.1-isl-compat.patch)
md5sums=('be78a47bd82523250eb3e91646db5b3d'
         '976c999b44c6e364455a670d12523242')

prepare() {
  cd ${_pkgbase}-${pkgver}
  
  # combination of upstream commits b561f860, 2d8b7c6b and 22643c94
  patch -p1 -i "$srcdir/cloog-0.18.1-isl-compat.patch"
}

build() {
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --with-isl=system --libdir=/usr/lib32 CC='gcc -m32'
  make
}

check() {
  cd ${_pkgbase}-${pkgver}
  make check || true
}

package() {
  make -C ${_pkgbase}-${pkgver} DESTDIR="${pkgdir}/" install
  rm -rf "${pkgdir}/usr"/{bin,include}
}
