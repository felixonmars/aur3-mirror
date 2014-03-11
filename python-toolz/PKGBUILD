# Maintainer : heathjohns <heath@elesi.org>

pkgname=python-toolz
pkgver=0.5.2
pkgrel=0
pkgdesc="A set of utility functions for iterators, functions, and dictionaries."
arch=('i686' 'x86_64')
url="http://toolz.readthedocs.org/en/latest/index.html"
license=('BSD')
depends=('python')
source=("https://pypi.python.org/packages/source/t/toolz/toolz-$pkgver.tar.gz")
md5sums=('24604d593e07518c0b246cf0f7447c59')

build() {
  cd "$srcdir/toolz-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/toolz-$pkgver"
  python setup.py install --root=$pkgdir
}
