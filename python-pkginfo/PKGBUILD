# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python
_distname=pkginfo
pkgname=${_python}-${_distname}
pkgver=1.2b1
pkgrel=1
pkgdesc="Query metadatdata from sdists / bdists / installed packages"
arch=(any)
url="http://pythonhosted.org//pkginfo"
license=('Python')
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
md5sums=('54511cf8b03eb08220fa9ec9e53f5d31')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
