# Maintainer: schuay <jakob.gruber@gmail.com>

pkgname=jmock
pkgver=2.5.1
pkgrel=1
pkgdesc="A a library that supports test-driven development of Java code with mock objects"
arch=('any')
url="http://www.jmock.org/"
license=('custom')
depends=('java-runtime')
source=("http://www.jmock.org/dist/${pkgname}-${pkgver}-jars.zip"
        "LICENSE")

# LICENSE taken from http://www.jmock.org/license.html

build() {
  mkdir -p "${pkgdir}"/usr/share/java/${pkgname}
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/* \
    "${pkgdir}"/usr/share/java/${pkgname}/
  install -Dm644 "${srcdir}"/LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

md5sums=('bc0e1a180a036217373b00f9a8914758'
         '06d88c3fe1a1c0afe998d6ee8e9ab6cf')

# vim:set ts=2 sw=2 et:
