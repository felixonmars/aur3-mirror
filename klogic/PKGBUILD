# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: MatÃas J. Rossi <matiasjrossi@gmail.com>
# Maintainer: Mark Coolen [mark dot coolen atatat g mail dot com]

pkgname=klogic
pkgver=4.0.2
pkgrel=2
pkgdesc="A digital circuit editor and simulator for KDE"
arch=('i686' 'x86_64')
url="http://www.a-rostin.de/"
license=('GPL3')
depends=('kdebase-runtime')
makedepends=('automoc4' 'cmake')
source=("http://www.a-rostin.de/klogic/releases/${pkgname}-${pkgver}.tar.gz"
        klogic-desktop.patch)
md5sums=('072fbc982a5c1671325bba32867b735a'
         '3180a7f47d47a6e17c3dcfed3fadb861')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../../klogic-desktop.patch src/klogic.desktop
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
