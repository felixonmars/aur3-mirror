# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=pirum
pkgver=1.1.5
pkgrel=1
pkgdesc="Pirum is a simple and nice looking PEAR channel server manager that lets you setup PEAR channel servers in a matter of minutes."
url=http://pirum.sensiolabs.org/
arch=('any')
license=('MIT')
depends=('php')

source=("${pkgname}-${pkgver}.php::http://github.com/fabpot/Pirum/raw/v${pkgver}/${pkgname}")

sha256sums=('e5f2f3457100439012d5532271a8ddde1a5cee767331302b56087584a697403d')

build() {
  true
}

package() {
  cd ${srcdir}
  install -Dm755 ${pkgname}-${pkgver}.php ${pkgdir}/usr/bin/${pkgname}
}

