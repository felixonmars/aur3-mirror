# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python
_distname=devpi-web
pkgname=${_python}-${_distname}
pkgver=2.2.0
pkgrel=1
pkgdesc="reliable fast pypi.python.org caching server"
arch=(any)
url="http://doc.devpi.net"
license=('MIT')
depends=(
    "${_python}"
    "${_python}-beautifulsoup4>=4.3.2"
    "${_python}-devpi-common>=2.0.3"
    "${_python}-devpi-server>=2.1.0"
    "${_python}-docutils>=0.11"
    "${_python}-pygments>=1.6"
    "${_python}-pyramid>=1.5.1"
    "${_python}-pyramid-chameleon"
    "${_python}-whoosh"
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
md5sums=('2476967f639e84bcfe5664b2d423c811')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
