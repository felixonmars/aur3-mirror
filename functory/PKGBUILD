# Maintainer: Basile Clement <basile@clement.pm>

pkgname=functory
pkgver=0.5
pkgrel=6
pkgdesc="A distributed computing library for Objective Caml which facilitates distributed execution of parallelizable computations in a seamless fashion."
arch=('i686' 'x86_64')
url="http://functory.lri.fr/"
license=('LGPL')
source=("http://www.lri.fr/~filliatr/functory/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('c7e6576c3e6b3a7e247eab530d7e4de8')
depends=('glibc' 'ocaml')
options=(staticlibs)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
