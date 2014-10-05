# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python
_distname=monk
pkgname=$_python-$_distname
pkgver=0.13.2
pkgrel=1       # XXX don't forget to reset on version change
pkgdesc="An unobtrusive data modeling, manipulation and validation library (MongoDB ODM included)"
arch=(any)
url="http://github.com/neithere/monk/"
license=('LGPL3')
depends=("${_python}>=3.2")
makedepends=("${_python}-distribute")
optdepends=(
  "${_python}-pymongo: MongoDB ODM"
)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/${_distname:0:1}/$_distname/$_distname-$pkgver.tar.gz)
md5sums=('9e15af98c22bc47e36db53d1d1573258')

package() {
  cd "$srcdir/$_distname-$pkgver"
  $_python setup.py install --root="$pkgdir" --optimize=1
}
