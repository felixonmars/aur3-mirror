# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python
_distname=devpi-client
pkgname=${_python}-${_distname}
pkgver=2.0.3
pkgrel=1
pkgdesc="devpi upload/install/... workflow commands for Python developers"
arch=(any)
url="http://doc.devpi.net"
license=('MIT')
depends=(
    "${_python}-tox>=1.7.1"
    "${_python}-devpi-common>=2.0.3"
    "${_python}-pkginfo>=1.2b1"
    "${_python}-check-manifest>=0.21"
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
md5sums=('82ca98146340ea66ee5d9576633638bd')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}

