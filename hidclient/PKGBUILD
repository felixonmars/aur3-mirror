# Maintainer: Ng Oon-Ee <ngoonee.talk@gmail.com>
pkgname=hidclient
pkgver=20120728
pkgrel=1
pkgdesc="Emulate a bluetooth keyboard and/or mouse using your machine"
arch=('i686' 'x86_64')
url="http://anselm.hoffmeister.be/computer/hidclient"
license=('GPL2')
depends=('bluez')
source=("http://anselm.hoffmeister.be/computer/${pkgname}/${pkgname}-${pkgver}.tar.bz2")

build() {
  cd "${srcdir}"
  make
}

package() {
  install -Dv -m755 "${srcdir}/hidclient" "${pkgdir}/usr/bin/hidclient"
}

# vim:set ts=2 sw=2 et:
md5sums=('70ca8cabf77dbe9b70ba62808942dc29')
