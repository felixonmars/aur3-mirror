# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=coldfire
pkgver=0.3.1
pkgrel=4
pkgdesc="Motorola emulator"
arch=('i686')
url="http://www.slicer.ca/coldfire/"
license=('GPL')
depends=('readline')
options=('!makeflags')
source=(http://www.slicer.ca/coldfire/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('c48e9722adc8cf9faec8b3407a888727')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  install -d ${pkgdir}/usr/bin
  make prefix=${pkgdir}/usr install || return 1
}
