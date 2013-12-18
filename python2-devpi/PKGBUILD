# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python2
_distname=devpi
pkgname=${_python}-${_distname}
pkgver=1.2.1
pkgrel=3
pkgdesc="github-style pypi index server and packaging meta tool."
arch=(any)
url="http://doc.devpi.net"
license=('MIT')
depends=(
    "${pkgname}-server>=1.2.1"
    "${pkgname}-client>=1.2.1"
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
md5sums=('4268447615eb40a94d50079f5d32a38b')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
