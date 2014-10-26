# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
_python=python2
_distname=blessings
pkgname=$_python-$_distname
pkgver=1.6
pkgrel=1
pkgdesc="A thin, practical wrapper around terminal coloring, styling, and positioning"
arch=(any)
url="https://github.com/erikrose/blessings"
license=('MIT')
depends=('python2>=2.5')
makedepends=('python2-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/${_distname:0:1}/$_distname/$_distname-$pkgver.tar.gz")
md5sums=('4f552a8ebcd4982693c92571beb99394')

package() {
  cd "$srcdir/$_distname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 || exit 1
}
