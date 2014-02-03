# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=btsco
pkgver=0.5
pkgrel=3
pkgdesc="Bluez Bluetooth SCO Tool"
arch=(i686 x86_64)
license=("GPL")
url="http://bluetooth-alsa.sourceforge.net"
depends=('alsa-lib' 'xmms' 'bluez-libs')
makedepends=('automake' 'autoconf')
source=(http://downloads.sourceforge.net/sourceforge/bluetooth-alsa/${pkgname}-${pkgver}.tgz)
md5sums=('d9fdd63a9e22ba839a41c8a9b89c2dda')
build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=${startdir}/pkg/${pkgname}/usr
  make || return 1
  make install
}
