# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python2
_distname=sandman
pkgname=$_python-$_distname
pkgver=0.7.1
pkgrel=1
pkgdesc="Makes things REST"
arch=(any)
url="http://github.com/jeffknupp/sandman"
license=('MIT')
depends=(
    "$_python-flask>=0.10.1"
    "$_python-flask-sqlalchemy>=1.0"
    "$_python-sqlalchemy>=0.8.2"
    "$_python-flask-admin>=1.0.6"
    "$_python-docopt>=0.6.1"
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
md5sums=('30bfdde1100345d61ed3f5693412b06f')

package() {
    cd "$srcdir/$_distname-$pkgver"
    $_python setup.py install --root="$pkgdir" --optimize=1 || exit 1
}
