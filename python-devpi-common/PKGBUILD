# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python
_distname=devpi-common
pkgname=${_python}-${_distname}
pkgver=2.0.3
pkgrel=1
pkgdesc="utilities jointly used by devpi-server and devpi-client"
arch=(any)
url="http://doc.devpi.net"
license=('MIT')
depends=(
    "${_python}-requests>=2.0.3"
    "${_python}-py>=1.4.20"
)
makedepends=("${_python}-distribute")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/${_distname:0:1}/${_distname}/${_distname}-${pkgver}.tar.gz)
md5sums=('f1fe6e3429ba17fd564f66ccb43a64ad')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"

    # The `devpi` script is in `devpi-client`.  Avoiding conflict:
    sed -i 's/[ ]*entry_points.*$//' setup.py

    ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
