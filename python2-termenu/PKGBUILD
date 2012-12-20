pkgname=python2-termenu
pkgver=1.1.2
pkgrel=1
pkgdesc="Interactive in-line menus for Unix-based terminals"
arch=(any)
url="http://pypi.python.org/pypi/termenu"
license=('GPL')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=("http://pypi.python.org/packages/source/t/termenu/termenu-${pkgver}.tar.gz")
md5sums=('9e0054ed7d522247f1457788109539ad')

package() {
  cd "$srcdir/termenu-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
