# Maintainer: NAKASHIMA, Makoto <makoto.nksm@gmail.com>
pkgname=llnextgen
pkgver=0.5.5
pkgrel=1
pkgdesc="LLnextgen is an Extended-LL(1) parser generator."
arch=('x86_64')
url='http://os.ghalkes.nl/LLnextgen/'
license=('GPL3')
source=("http://os.ghalkes.nl/LLnextgen/releases/LLnextgen-${pkgver}.tgz")

build() {
  cd ${srcdir}/LLnextgen-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/LLnextgen-${pkgver}
  make prefix="${pkgdir}/usr" install
}

md5sums=('f3733cca58f862d41b8fb3d9e20b8426')

