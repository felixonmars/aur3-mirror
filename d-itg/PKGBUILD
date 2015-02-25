# Maintainer: GI_Jack <GI_Jack@hackermail.com>
_pkgname=D-ITG
_pkgver=2.8.1-r1023

pkgname=d-itg
pkgver=2.8.1.r1023
pkgrel=1
pkgdesc="Distributed Internet Traffic Generator - A tool for generating realistic network load."
url="http://traffic.comics.unina.it/software/ITG/"
arch=('x86_64' 'i686')
license=('GPL3')

source=("http://traffic.comics.unina.it/software/ITG/codice/D-ITG-${_pkgver}-src.zip")
sha256sums=('e3974b167a684110cacb0436193d5dabdfc90d2c8e1bb18838e20c75bd406ebf')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/src"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/src"
  make install PREFIX="${pkgdir}/usr/"
}

# vim:set ts=2 sw=2 et:
