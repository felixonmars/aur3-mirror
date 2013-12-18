# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python2
_distname=devpi-common
pkgname=${_python}-${_distname}
pkgver=1.2
pkgrel=2
pkgdesc="utilities jointly used by devpi-server and devpi-client"
arch=(any)
url="http://doc.devpi.net"
license=('MIT')
depends=(
    "${_python}-requests>=2.0.2"
    "${_python}-py>=1.1.18"
)
makedepends=("${_python}-distribute")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/d/${_distname}/${_distname}-${pkgver}.tar.gz)
md5sums=('d1d50f1523c1e683a55719b18cd5ee21')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"

    # The `devpi` script is in `devpi-client`.  Avoiding conflict:
    sed -i 's/[ ]*entry_points.*$//' setup.py

    ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
