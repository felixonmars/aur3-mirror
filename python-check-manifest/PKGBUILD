# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python
_distname=check-manifest
pkgname=${_python}-${_distname}
pkgver=0.21
pkgrel=1
pkgdesc="Check MANIFEST.in in a Python source package for completeness"
arch=(any)
url="https://github.com/mgedmin/check-manifest"
license=('MIT')
depends=(
    "${_python}"
)
# MISSING DEP: "${_python}-pyramid>=1.5.1"
makedepends=("${_python}-distribute")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/${_distname:0:1}/${_distname}/${_distname}-${pkgver}.tar.gz)
md5sums=('d8290415e9178a4d812b73fb2e45a7d1')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
