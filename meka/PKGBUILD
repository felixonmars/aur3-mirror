# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=meka
pkgver=0.72
_pkgver=2007-05-17
pkgrel=1
pkgdesc="A multi-machine emulator that supports early Sega hardware, Colecovision and Othello Multivision."
url="http://www.smspower.org/meka/"
license=('custom:MEKA License')
arch=('i686')
depends=('libpng' 'allegro')
makedepends=('nasm')
source=(http://www.smspower.org/${pkgname}/releases/${pkgname}-${_pkgver}-srcs-v${pkgver%.*}${pkgver#*.}.zip \
  http://www.smspower.org/${pkgname}/themes/${pkgname}-themes-20041010-default.zip \
  ${pkgname}-${pkgver}.diff)
md5sums=('bb0a5ddd1739441c7eb4bfbf32f5743f'
         '950672c291dee3e33c49fff2e0edb5c9'
         'b2c394e50c869a6eff0bf15526006328')

build() {
  cd ${startdir}/src
  patch -p0 < ${pkgname}-${pkgver}.diff

  cd ${startdir}/src/srcs
  make PREFIX=/usr || return 1
  make PREFIX=/usr DESTDIR=${startdir}/pkg install

  # Include the license
  cd ${startdir}/src
  install -Dm644 sources.txt ${startdir}/pkg/usr/share/licenses/custom/${pkgname}/license.txt
}
