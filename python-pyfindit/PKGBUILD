# Maintainer: Jose M. Dana

pkgname=python-pyfindit
pypiname=pyfindit
pkgver=0.7.3
pkgrel=1
pkgdesc="A smart grep for Python files."
arch=(any)
url="https://github.com/jmdana/pyfindit"
license=('GPL')
groups=()
depends=("python")
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/p/pyfindit/pyfindit-$pkgver.tar.gz")
md5sums=("9993a949fceabe8833273b34b43e991d")

package() {
  cd "$srcdir/$pypiname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
