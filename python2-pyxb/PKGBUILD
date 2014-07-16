# Maintainer: Jurica Bradaric <jbradaric@gmail.com>
pkgname=python2-pyxb
pkgver=1.2.3
pkgrel=1
pkgdesc="Generates Python code for classes that correspond to data structures defined by XMLSchema"
arch=(any)
url="http://pyxb.sourceforge.net/"
license=('Apache')
makedepends=('python2' 'python2-setuptools')

source=("https://pypi.python.org/packages/source/P/PyXB/PyXB-$pkgver.tar.gz")
sha256sums=('af378818998bfbebaf38f759b6759d917b2b56f00620dcdc276e886af4dd672e')

build() {
    cd "$srcdir/PyXB-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/PyXB-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
