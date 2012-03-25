# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=makepp
pkgver=2.0
pkgrel=1
pkgdesc="Drop-in replacement for GNU make that allows for reliable builds and simpler build files."
arch=('any')
url="http://makepp.sourceforge.net/"
license=('GPL2' 'PerlArtistic')
depends=('perl')
options=('!ccache')
source=("http://downloads.sf.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tgz")
md5sums=('634d67455bf32fe1f16f65b7e32f4a45')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make test #-k test || { touch .test_done; return 0; }
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/usr" install
}

# vim:set ts=2 sw=2 et:
