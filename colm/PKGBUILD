# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Maintainer: perlawk

pkgname=colm
pkgver=0.12.0
pkgrel=2
pkgdesc='A programming language designed for the analysis and transformation of computer languages.'
url='http://www.complang.org/colm/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs')
options=('staticlibs')
source=("http://www.complang.org/colm/colm-${pkgver}.tar.gz")

build() {
  cd colm-${pkgver}
  
  ./configure \
    --prefix=/usr \
  make
}

package() {
  cd colm-${pkgver}

  make DESTDIR=${pkgdir} install
}
md5sums=('079a1ed44f71d48a349d954096c8e411')
