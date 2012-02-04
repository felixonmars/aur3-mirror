# $Id$
# Contributor: damir <damir@archlinux.org>
# Contributor: Kevin Edmonds <edmondskevin@hotmail.com>
# Contributor: sudokode

pkgname=libmtp-updated
pkgver=1.1.1
pkgrel=1
pkgdesc="library implementation of the Media Transfer Protocol"
arch=("i686" "x86_64")
url="http://libmtp.sourceforge.net"
license=('LGPL')
depends=('libusb-compat')
makedepends=('doxygen')
conflicts=('libmtp')
provides=('libmtp')
options=('!libtool')
source=(http://downloads.sourceforge.net/libmtp/libmtp-${pkgver}.tar.gz)
md5sums=('073e1c2a00ba377f68dce47727e185ae')

build() {
  cd "${srcdir}/libmtp-${pkgver}"
  ./configure --prefix=/usr --with-udev-rules=52-libmtp.rules
  make
}

package() {
  cd "${srcdir}/libmtp-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
