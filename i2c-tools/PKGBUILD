# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=i2c-tools
pkgver=3.1.0
pkgrel=2
pkgdesc="Heterogeneous set of I2C tools for Linux that used to be part of lm-sensors"
arch=('i686' 'x86_64')
url="http://www.lm-sensors.org/wiki/I2CTools"
license=('GPL')
depends=('lm_sensors' 'perl' 'read-edid')
options=(strip)
source=(http://dl.lm-sensors.org/${pkgname}/releases/${pkgname}-${pkgver}.tar.bz2 Makefile.patch)
md5sums=('f15019e559e378c6e9d5d6299a00df21'
         '527fa593781273f77b89672992b14f5e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" 
  patch -p0 < ${srcdir}/Makefile.patch && make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" && make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/include/linux/i2c-dev.h"
}
# vim:set ts=2 sw=2 et:
