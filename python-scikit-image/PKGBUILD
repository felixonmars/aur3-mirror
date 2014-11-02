# Maintainer: Brett Nelson <brettnelson at ufl dot edu>

pkgname=python-scikit-image
pkgver=0.10.1
pkgrel=1
pkgdesc='Image processing algorithms for SciPy (Python 3)'
arch=('any')
url='http://scikit-image.org/'
license=('BSD')
depends=('python-scipy')
makedepends=('python-setuptools' 'cython>=0.17' 'python-numpy>=1.6' 'python-six')
optdepends=('python-matplotlib')
source=("https://pypi.python.org/packages/source/s/scikit-image/scikit-image-$pkgver.tar.gz")
md5sums=('ee48bdd23933272ee4906980515e8b54')

build() {
  cd "$srcdir/scikit-image-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/scikit-image-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
