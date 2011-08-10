# Contributor: Jesus Lazaro Plaza <jesuslazaro84@gmail.com>

pkgname=wlandecrypter
pkgver=1.3.2
pkgrel=1
pkgdesc="Program to very fast recovering WEP keys of Telefonica (Spain) routers"
url="http://www.seguridadwireless.net/"
license=('GPL')
arch=('i686' 'x86_64')
install=wlandecrypter.install
source=(http://www.seguridadwireless.net/archivos/${pkgname}-${pkgver}.tar.gz)
md5sums=('507fe6988be1a1ee50df92a14cbefaf3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make clean || return 1
  make || return 1
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/wlandecrypter ${pkgdir}/usr/bin/wlandecrypter
}
