# Contributor: Jonathan Liu <net147@hotmail.com>
pkgname=libpri
pkgver=1.4.15
pkgrel=1
pkgdesc="Primary Rate ISDN (PRI) library for T1/E1/J1 interfaces"
url="http://www.asterisk.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('dahdi')
source=("http://downloads.asterisk.org/pub/telephony/libpri/releases/${pkgname}-${pkgver}.tar.gz")
md5sums=('206fbcf014ad85bf6613f169ca425e7f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_PREFIX="${pkgdir}" DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
