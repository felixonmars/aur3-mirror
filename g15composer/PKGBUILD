# Contributor: Jayson Cofell <kerick@shiftedbit.net>
# Contributor: onestep_ua <onestep@ukr.net>

pkgname=g15composer
pkgver=3.2
pkgrel=2
pkgdesc="Composer utility for Logitech G15 keyboard displays."
arch=('i686' 'x86_64')
url="http://g15tools.sourceforge.net/"
license=('GPL')
depends=('libg15' 'libg15render' 'g15daemon')
makedepends=('flex')
source=(http://downloads.sourceforge.net/g15tools/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c1eda0cc1fb45a126f6a9b9250e6038c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
