# Maintainer: Max Schlemmer <max.schlemmer@gmail.com>
pkgname=python2-tinyarray
pkgver=1.0.5
pkgrel=1
pkgdesc="Similar to NumPy arrays, but optimized for small sizes"
arch=('any')
url="http://git.kwant-project.org/tinyarray/about/"
license=('Simplified BSD License')
depends=(python2)
source=(http://downloads.kwant-project.org/tinyarray/tinyarray-$pkgver.tar.gz
		http://downloads.kwant-project.org/tinyarray/tinyarray-$pkgver.tar.gz.sig)
md5sums=('0ef161e8b5ae711fe3e1babb8702105e'
         'SKIP')

build() {
    cd "$srcdir/tinyarray-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/tinyarray-$pkgver"
    python2 setup.py install --skip-build -O1 --root="$pkgdir" --optimize=1
}
