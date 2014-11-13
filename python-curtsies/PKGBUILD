_pkgname=curtsies
pkgname=python-curtsies
pkgver=0.1.15
pkgrel=1
pkgdesc="Curses-like terminal wrapper with a display based on compositing 2d arrays of text"
arch=('any')
url="https://github.com/thomasballinger/curtsies"
license=('MIT')
depends=('python-blessings' 'python-setuptools')
source=("https://pypi.python.org/packages/source/c/curtsies/curtsies-${pkgver}.tar.gz")
md5sums=('7155646d60ac2286db005ebd5c185a63')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir"
}
