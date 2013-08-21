# Maintainer: mmm
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Stefan Husmann <stefan-husmannt-online.de>

pkgname=protege
pkgver=4.3.0.304
_pkgver=4.3.0-304
_ver=4.3
_veralt=4.2 # temp hack
pkgrel=2
pkgdesc='Free, open source ontology editor and knowledge-base framework'
arch=('any')
url='http://protege.stanford.edu/'
license=('MPL')
depends=('java-runtime' 'graphviz')
source=("http://protege.stanford.edu/download/protege/$_ver/zip/protege-${_pkgver}.zip"
        "${pkgname}.sh")
md5sums=('699dfd9dca827c69c07b71ef8a6c62ae'
         'ccc2f39b60b852a93b3f159d4684aaeb')

package() {
  cd Protege_$_veralt

  # remove windows crud
  rm run.bat

  install -d ${pkgdir}/usr/share/java/${pkgname}
  cp -r * ${pkgdir}/usr/share/java/${pkgname}

  install -d ${pkgdir}/usr/bin
  install -D ${srcdir}/protege.sh ${pkgdir}/usr/bin/protege
}
