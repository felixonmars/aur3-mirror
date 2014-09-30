# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python
_distname=execnet

pkgname=${_python}-${_distname}
pkgver=1.2.0
pkgrel=1
pkgdesc="rapid multi-Python deployment"
arch=('any')
license=('GPL')
url="http://codespeak.net/execnet"
depends=(
    ${_python}
)
makedepends=("${_python}-distribute")
source=(http://pypi.python.org/packages/source/${_distname:0:1}/${_distname}/${_distname}-${pkgver}.tar.gz)
md5sums=('1886d12726b912fc2fd05dfccd7e6432')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1
}
