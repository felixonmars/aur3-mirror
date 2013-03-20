# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist-stable
_pkgname=ptxdist
pkgver=2012.12.1
pkgrel=0
pkgdesc="Embedded Linux build system [stable version to build OSELAS.Toolchain()]"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('92e97cc8d4af80c2c392c8f6367a03a3ab784d03b9974b566377227d71052ee5')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  # remove the symlink
  rm "${pkgdir}/usr/bin/ptxdist"
}
