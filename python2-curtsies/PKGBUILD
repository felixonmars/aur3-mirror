_pkgname=curtsies
pkgname=python2-curtsies
pkgver=0.0.34
pkgrel=1
pkgdesc="Curses-like terminal wrapper with a display based on compositing 2d arrays of text"
arch=('any')
url="https://github.com/thomasballinger/curtsies"
license=('MIT')
depends=('python2-blessings')
source=("https://pypi.python.org/packages/source/c/curtsies/curtsies-${pkgver}.tar.gz")

build() {
  cd $_pkgname-$pkgver

  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python2 setup.py install --root="$pkgdir"
}
md5sums=('60107a6223a9e9f96064955bb199fe51')
