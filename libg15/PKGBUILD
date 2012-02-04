# Contributor: onestep_ua <onestep@ukr.net>

pkgname=libg15
pkgver=1.2.7
pkgrel=1
pkgdesc="Provides low-level access to the Logitech G15 and G11 keyboards and Z10 speakers"
arch=('i686' 'x86_64')
url="http://www.g15tools.com/"
license=('GPL')
depends=('libusb')
options=(!libtool)
source=(http://downloads.sourceforge.net/g15tools/${pkgname}-${pkgver}.tar.bz2)
md5sums=('718c8e1d0d0d4657f95427593d90a27a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR="${pkgdir}" install
}
