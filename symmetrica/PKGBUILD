# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>
pkgname=symmetrica
pkgver=2.0
pkgrel=2
pkgdesc="Algorithms for symmetric groups and classical groups"
arch=('i686' 'x86_64')
url="http://www.algorithm.uni-bayreuth.de/en/research/SYMMETRICA/"
license=('public')
depends=()
source=('http://www.algorithm.uni-bayreuth.de/en/research/SYMMETRICA/SYM2_0_tar.gz'
        'macro.h.patch')
md5sums=('c901a30ffb44715adc85ec43a9838069'
         '2a018908686a23ee12b3e7b5d104c929')

build() {
  cd "$startdir/src"

  sed -i -e 's/-O2/$(CFLAGS)/' makefile
  patch -p0 < ../macro.h.patch
  make || return 1
  ar crs libsymmetrica.a *.o
  install -D -m 644 libsymmetrica.a "$pkgdir"/usr/lib/libsymmetrica.a
  mkdir -p "$pkgdir"/usr/include/symmetrica/
  install -m 644 *.h "$pkgdir"/usr/include/symmetrica/
}

