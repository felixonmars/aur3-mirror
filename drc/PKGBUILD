# Maintainer: Pär Forsling <pelle (PROTECT) @ (FROM SPAM) forsling (BOTS) .net>
# Contributor: Steven Allen <steven (PROTECT) @ (FROM SPAM) stebalien (BOTS) .com>

pkgname=drc
pkgver=3.2.1
pkgrel=1
pkgdesc="Generates digital room correction FIR filters"
arch=('i686' 'x86_64')
url="http://drc-fir.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=(http://downloads.sourceforge.net/drc-fir/drc-${pkgver}.tar.gz makefile.patch)
sha256sums=('13a0f64583beaa9f14e217f52b8f3839d10311c55da45d6171293760436a5998'
            '252032d0ed81e23c65de1a85abd819b72e4dc5613d3bfdfd70d2dcdd4b74ebad')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}/source"
  patch -p2 < ../../makefile.patch
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/source"
  make DESTDIR="${pkgdir}" install
}
