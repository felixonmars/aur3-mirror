# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>

_python=python
_distname=progress
pkgname=${_python}-${_distname}
pkgver=1.2
pkgrel=1
pkgdesc='Easy to use progress bars'
arch=('any')
url='http://github.com/verigak/progress/'
license=('ISC')
depends=("${_python}")
makedepends=("${_python}-distribute")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/p/${_distname}/${_distname}-${pkgver}.tar.gz)
md5sums=('c1dbf49a41e80408d3874d976ba894cc')

package() {
    cd "${srcdir}/${_distname}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
