# Maintainer: kevku <kevku@gmx.com>
pkgname=python-singledispatch
pkgver=3.4.0.3
pkgrel=1
pkgdesc="This library brings functools.singledispatch from Python 3.4 to Python 2.6-3.3"
arch=('any')
url="https://pypi.python.org/pypi/singledispatch"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/s/singledispatch/singledispatch-$pkgver.tar.gz")
sha256sums=('5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c')

build() {
	cd "$srcdir/singledispatch-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/singledispatch-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
