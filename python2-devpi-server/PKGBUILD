# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python2
_distname=devpi-server
pkgname=${_python}-${_distname}
pkgver=1.2.1
pkgrel=1
pkgdesc="reliable fast pypi.python.org caching server"
arch=(any)
url="http://doc.devpi.net"
license=('MIT')
depends=(
    "python2>=2.6"
    "${_python}-py>=1.4.18"
    "${_python}-execnet>=1.1"
    "${_python}-itsdangerous>=0.23"
    "${_python}-docutils>=0.11"
    "${_python}-pygments>=1.6"
    "${_python}-bottle>=0.11.6"
    "${_python}-devpi-common>=1.2"
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
md5sums=('78c01f200b3588a2b1840b26e3cacbdf')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
