# Maintainer: Allen Li <darkfeline@abagofapples.com>

pkgname=python-spynner
pkgver="1.10"
pkgrel=1
pkgdesc="Programmatic web browsing module with AJAX support for Python 2"
arch=('any')
url="http://pypi.python.org/pypi/spynner/1.10"
source=("http://pypi.python.org/packages/source/s/spynner/spynner-$pkgver.tar.gz")
md5sums=('9fd6088fc92f7948cb694b8736399173')
license=('GPL3')
depends=('python2' 'libxml2' 'pyqt')

build() {
    cd "$srcdir/spynner-$pkgver"
    python2 setup.py build --root="$pkgdir"
}

package() {
    cd "$srcdir/spynner-$pkgver"
    python2 setup.py install --root="$pkgdir"
}
