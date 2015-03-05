# $Id: PKGBUILD 126426 2015-01-22 20:49:33Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libbliss
pkgver=0.72
pkgrel=1
pkgdesc="A library for computing automorphism groups and canonical forms of graphs"
arch=(i686 x86_64)
url="http://www.tcs.tkk.fi/Software/bliss/index.html"
license=(GPL3)
depends=(glibc)
source=("http://www.tcs.hut.fi/Software/bliss/bliss-$pkgver.zip")
md5sums=('6f0e114944fa0863870b7f631850abb2')

build() {
  cd bliss-$pkgver

  make
}

package() {
  cd bliss-$pkgver

  mkdir -p "$pkgdir"/usr/{include/bliss,lib}
  cp *.hh "$pkgdir"/usr/include/bliss/
  cp libbliss.a "$pkgdir"/usr/lib/
}

