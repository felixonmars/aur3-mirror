# Maintainer: EEva <eeva@marvid.fr>

pkgname=care-static
_pkgname=care
pkgver=2.2.1
pkgrel=4
pkgdesc="Comprehensive Archiver for Reproducible Execution - static version"
arch=('x86_64')
url="http://reproducible.io"
license=('GPL')
provides=('care')
depends=
source=(http://static.reproducible.io/${_pkgname}-${arch})
md5sums=('6dd4ac1cd70f1cb3c8c8caea159e0ae0')

build() {
  echo DONE
}

package() {
  install -m755 -d "${pkgdir}"/usr/bin
  install -m755 ${_pkgname}-${arch} "${pkgdir}"/usr/bin/${_pkgname}
}

# vim: ft=sh syn=sh et
