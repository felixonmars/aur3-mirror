# Maintainer: dnuux <dnuuxx@gmail.com>

pkgname=python-update_checker
_pkgname=update_checker
pkgver=0.11
pkgrel=1
pkgdesc="A python module that will check for package updates"
url="https://github.com/bboe/update_checker"
arch=('any')
license=('BSD')
depends=('python-requests' 'python-setuptools')
source=("https://pypi.python.org/packages/source/u/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('1daa54bac316be6624d7ee77373144bb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
