# Maintainer: <kfgz at interia dot pl>

pkgname=cls
pkgver=1.1
pkgrel=1
pkgdesc="A simple ncurses game."
arch=('i686' 'x86_64')
url="http://kfgz.mydevil.net/cls/"
license=('other')
depends=('ncurses')
source=(http://kfgz.mydevil.net/cls/${pkgname}-${pkgver}.tar.gz)
md5sums=('f77375d0abc4846db9b53d2d6448a396')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
