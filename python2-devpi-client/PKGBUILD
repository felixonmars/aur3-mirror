# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python2
_distname=devpi-client
pkgname=${_python}-${_distname}
pkgver=1.2.1
pkgrel=1
pkgdesc="devpi upload/install/... workflow commands for Python developers"
arch=(any)
url="http://doc.devpi.net"
license=('MIT')
depends=(
    "${_python}-tox>=1.6.1"
    "${_python}-devpi-common>=1.2"
    "${_python}-pkginfo>=1.2b1"
    "${_python}-py>=1.4.18"
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
md5sums=('5047a42efb74331c56314ee483317c54')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}

