# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=python2-capstone
_pkgname=capstone
pkgver=3.0.3
pkgrel=1
pkgdesc='Python bindings for multi-platform, multi-architecture capstone disassembly framework'
arch=('any')
url='http://www.capstone-engine.org/index.html'
license=('BSD')
depends=('capstone' 'python2')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/aquynh/capstone/archive/${pkgver}.tar.gz)
sha512sums=('5847d89efe2d139d1dacff73547bfe682def6c23310da89dc8b84686e2a718dd361da242417a895bb0fc425401b9baf15348f1994da052a05c2f64a238659c54')

build() {
  cd ${_pkgname}-${pkgver}/bindings/python
  python2 setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}/bindings/python
  python2 test.py
}

package() {
  cd ${_pkgname}-${pkgver}/bindings/python
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 ../../LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
