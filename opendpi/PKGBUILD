# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=opendpi
pkgver=1.3.0
pkgrel=1
pkgdesc="The open source deep packet inspection engine"
arch=('i686' 'x86_64')
url="http://opendpi.org"
license=('LGPL')
depends=()
makedepends=('gcc' 'make')
optdepends=('libpcacp:  to compile included demo program')
install=OpenDPI.install
source=("http://opendpi.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('e00bd0df3746f928cc1e5b34c6eed0fe')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr && make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install

  mkdir -p "${pkgdir}/usr/share/doc/OpenDPI/demo"

  cp src/examples/OpenDPI_demo/*.[c,h] ${pkgdir}/usr/share/doc/OpenDPI/demo/
}

# vim:set ts=2 sw=2 et:
