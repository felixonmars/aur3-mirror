# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python
_distname=devpi
pkgname=${_python}-${_distname}
pkgver=2.1.0
pkgrel=2
pkgdesc="github-style pypi index server and packaging meta tool."
arch=(any)
url="http://doc.devpi.net"
license=('MIT')
depends=(
    "${pkgname}-server>=2.1.0"
    "${pkgname}-client>=2.0.3"
    "${pkgname}-web>=2.2.0"
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
md5sums=('8d249364e614cf91ea502eae1a32bf27')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
