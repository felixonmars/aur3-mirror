# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# 	AUR Package Maintainer: Diogo B. <db_eee-at-hotmail-dot-com>

pkgname=libusbx
pkgver=1.0.11
pkgrel=2
depends=('glibc')
pkgdesc="Library to enable user space application programs to communicate with USB devices. libusb fork."
arch=(i686 x86_64)
url="http://libusbx.sourceforge.net/"
license=('LGPL')
source=(http://downloads.sourceforge.net/libusbx/libusbx-${pkgver}.tar.bz2)
options=(!libtool)
provides=('libusb=1.0.9')
conflicts=('libusb')
replaces=('libusb1' 'libusb')
md5sums=('9aaab6aee72f65900cc731ecbffb4cf4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr 
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
