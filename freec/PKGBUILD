# Maintainer: Fr_nk <freec AT vi-di.fr>
pkgname=freec
pkgver=1.0
pkgrel=1
pkgdesc="Display memory usage using graphs and nice colors."
arch=('x86_64' 'i686')
url="http://git.vi-di.fr/freec/"
license=('BSD')
depends=('glibc')
makedepends=('make')
provides=('freec')
conflicts=()
source=(http://git.vi-di.fr/${pkgname}/src/${pkgname}-${pkgver}.tar.gz)
md5sums=('70aacbe90f1a3bfb43894d950978ce71')

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  make DESTDIR=${pkgdir} install
}
