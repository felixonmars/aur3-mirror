# Maintainer: Tarmo Heiskanen <turskii@gmail.com>
pkgname=nuff
pkgver=1.2.1
pkgrel=1
pkgdesc='Network Universal Frame Forge'
arch=('i686' 'x86_64')
url='http://www.hcsw.org/nuff/'
license=('GPL')
source=("http://www.hcsw.org/nuff/downloads/nuff-${pkgver}.tgz")
depends=('libdnet' 'libpcap')
md5sums=('9819654000a117fe5132e0472659828e')

build() {
  cd "${srcdir}/nuff"
  make -e NUFFDIR="/usr/share/nuff"
}

package() {
  cd "${srcdir}/nuff"
  make -e NUFFDIR="${pkgdir}/usr/share/nuff" install
  install -Dm755 nuff "${pkgdir}/usr/bin/nuff"
}

# vim:set ts=2 sw=2 et:
