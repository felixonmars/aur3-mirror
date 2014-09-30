# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python
_distname=devpi-server
pkgname=${_python}-${_distname}
pkgver=2.1.0
pkgrel=2
pkgdesc="reliable fast pypi.python.org caching server"
arch=(any)
url="http://doc.devpi.net"
license=('MIT')
depends=(
    "${_python}"
    "${_python}-py>=1.4.23"
    "${_python}-execnet>=1.2"
    "${_python}-itsdangerous>=0.24"
    "${_python}-pygments>=1.6"
    "${_python}-pyramid>=1.5.1"
    "${_python}-waitress>=0.8.9"
    "${_python}-repoze.lru>=0.6"
    "${_python}-devpi-common>=2.0.3"
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
md5sums=('cb7431192aaae814eb117501cc499293')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
