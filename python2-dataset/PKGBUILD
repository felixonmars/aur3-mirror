# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python2
_distname=dataset
pkgname=$_python-$_distname
pkgver=0.5.5
pkgrel=2    # NOTE
pkgdesc='Toolkit for Python-based data processing'
arch=(any)
url='http://github.com/pudo/dataset'
license=('MIT')
depends=(
  "$_python-sqlalchemy>=0.9.1"
  "$_python-alembic>=0.6.2"
  "$_python-slugify>=0.0.6"
  "$_python-yaml>=3.10"
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
md5sums=('59c4ed70f881809b497e5f87ed6bb7c0')

package() {
  cd "$srcdir/$_distname-$pkgver"
  $_python setup.py install --root="$pkgdir" --optimize=1 || exit 1
}
