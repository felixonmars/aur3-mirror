# Original Maintainer: Stefano Facchini <stefano.facchini@gmail.com>
# Current Maintainer: Diogo Bento <db.eee.at.yahoo.dot.com>

pkgname=libusb-testing
_pkgname=libusb
pkgver=1.0.19_rc2
_pkgver=1.0.19
pkgrel=1
depends=('glibc' 'systemd')
pkgdesc="Library to enable user space application programs to communicate with USB devices."
arch=(i686 x86_64)
url="http://libusb.sourceforge.net/"
license=('LGPL')
options=(!libtool)
provides=("libusb=$pkgver" "libusbx=$pkgver")
conflicts=('libusbx')
replaces=('libusb1' 'libusbx')
source=(http://downloads.sourceforge.net/${_pkgname}/libusb-1.0/${_pkgname}-${_pkgver}/${_pkgname}-${_pkgver}-rc2.tar.bz2)
sha256sums=('cf7d55353c5e773abbb5042da70e25b25dc72f658c01bb90f83bc6fcbd6e06da')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}-rc2"
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${_pkgver}-rc2"
  make check
}

package () {
  cd "${srcdir}/${_pkgname}-${_pkgver}-rc2"
  make DESTDIR="${pkgdir}" install
}
