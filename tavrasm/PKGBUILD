# Maintainer: Laszlo Papp <djszapi2@gmail.com>
pkgname=tavrasm
pkgver=122jb
pkgrel=3
pkgdesc="Assembler for the Atmel AVR series of microcontrollers"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/tavrasm/"
license=('GPL')
depends=('gcc-libs')
source=(http://avr.bruger.mine.nu/${pkgname}.${pkgver}.zip)
md5sums=('9569b4c5c76cf61f806479737c3572ed')

build() {
  cd ${srcdir}/${pkgname}.${pkgver}/src
  make || return 1
  install -Dm755 ${srcdir}/${pkgname}.${pkgver}/src/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

