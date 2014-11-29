# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python2
_distname=python-slugify
pkgname=$_python-slugify
pkgver=0.1.0
pkgrel=1
pkgdesc="A Python slugify application that handles unicode"
arch=(any)
url="https://github.com/un33k/python-slugify"
license=('BSD')
depends=(
  "python2-unidecode>=0.04.16"
)
makedepends=("$_python-distribute")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/${_distname:0:1}/$_distname/$_distname-$pkgver.tar.gz)
md5sums=('bba3b03b746a37625a36bd4987df6009')

package() {
    cd "$srcdir/$_distname-$pkgver"
    $_python setup.py install --root="$pkgdir" --optimize=1 || exit 1
}
