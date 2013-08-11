# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>

_python=python2
_name=distlib

pkgname=${_python}-${_name}
pkgver=0.1.2
pkgrel=1
pkgdesc="Distribution utilities"
arch=(any)
url="https://bitbucket.org/vinay.sajip/distlib"
license=('BSD')
depends=()
makedepends=("${_python}-distribute")
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/d/${_name}/${_name}-${pkgver}.zip)
md5sums=('9e2bd43c670403a603f8a81f71a662a0')

package() {
   cd "${srcdir}/${_name}-${pkgver}"
   ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
