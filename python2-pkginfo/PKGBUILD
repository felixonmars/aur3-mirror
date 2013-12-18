# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python2
_distname=pkginfo
pkgname=${_python}-${_distname}
pkgver=1.2b1
pkgrel=1
pkgdesc='Query metadatdata from sdists / bdists / installed packages'
arch=(any)
url='https://pypi.python.org/pypi/pkginfo'
license=('Python')
depends=()
makedepends=("${_python}-distribute")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/p/${_distname}/${_distname}-${pkgver}.tar.gz)
md5sums=('54511cf8b03eb08220fa9ec9e53f5d31')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
