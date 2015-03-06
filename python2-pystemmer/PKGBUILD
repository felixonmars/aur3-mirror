# Maintainer: Mike Cooper <mythmon@gmail.com>
_pkgname="PyStemmer"
pkgname=python2-${_pkgname,,}
pkgver=1.3.0
pkgrel=1
pkgdesc="Snowball stemming algorithms, for information retrieval"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/PyStemmer"
license=('MIT' 'BSD')
depends=('python2')
source=("https://pypi.python.org/packages/source/P/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=("46ee623eeeba5a7cc0d95cbfa7e18abd")

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
