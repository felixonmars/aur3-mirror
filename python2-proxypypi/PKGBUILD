# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>

_python=python2
_name=proxypypi

pkgname=$_python-$_name
pkgver=1.2.2
pkgrel=1
pkgdesc="A PyPI caching proxy"
arch=(any)
url="https://bitbucket.org/r1chardj0n3s/proxypypi"
license=('BSD')
depends=('gunicorn' "${_python}-bottle" "${_python}-lockfile"
         "${_python}-distlib>=0.1.2")
makedepends=($_python-distribute)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/p/${_name}/${_name}-${pkgver}.tar.gz)
md5sums=('fd4b6bd49a769e54b76885d2677ad493')

package() {
   cd "${srcdir}/${_name}-${pkgver}"
   ${_python} setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
