# Maintainer: Allen Li <darkfeline@abagofapples.com>

pkgname=python2-spynner
pkgver=2.15
pkgrel=1
pkgdesc="Programmatic web browsing module with AJAX support for Python 2"
arch=('any')
url="http://pypi.python.org/pypi/spynner/"
license=('GPL3')
depends=('python2' 'libxml2' 'pyqt' 'python2-distribute')
source=("https://github.com/makinacorpus/spynner/archive/${pkgver}.tar.gz")
md5sums=('3122c4271e3247f69add2e47e80504a8')

build() {
    cd "$srcdir/spynner-${pkgver}"
    python2 setup.py install --root="$pkgdir"
}
