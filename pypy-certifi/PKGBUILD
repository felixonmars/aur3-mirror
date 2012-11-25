# Maintainer: William J Bowman <bluephoenix47@gmail.com>
# Contributor: Krzysztof Malinowski <boromil@gmail.com>

pkgname=pypy-certifi
_pkgname=certifi
pkgver=0.0.8
pkgrel=1
pkgdesc="Mozilla's SSL Certs"
arch=(any)
url="http://pypi.python.org/pypi/${_pkgname}/${pkgver}"
license=('GPL')
depends=('pypy')
makedepends=('pypy-distribute')
source=("http://pypi.python.org/packages/source/c/certifi/${_pkgname}-${pkgver}.tar.gz")
md5sums=('dc5f5e7f0b5fc08d27654b17daa6ecec') 

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  pypy setup.py install --root=${pkgdir}/ --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
