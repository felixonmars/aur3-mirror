# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgname=python2-oslo-sphinx
_pypiname=oslo.sphinx
pkgver=1.1
pkgrel=1
pkgdesc="OpenStack Sphinx Extensions"
arch=(any)
url="https://pypi.python.org/pypi/oslo.sphinx"
license=('Apache')
depends=('python2'
         'python2-oslo-config')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/o/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('6b41d488c4c8fe3a2310f16985d7bb85')

build() {
  cd "${_pypiname}-${pkgver}"
  /usr/bin/python2 setup.py build
}

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  /usr/bin/python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
