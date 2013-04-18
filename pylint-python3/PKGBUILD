# Maintainer: Allen Li <darkfeline at abagofapples.com>

pkgname=pylint-python3
pkgver=0.27.0
pkgrel=1
pkgdesc="Python code checker.  Built with Python 3."
arch=(any)
url="http://www.logilab.org/project/pylint"
license=('GPL')
depends=('python' 'python-logilab-astng')
conflicts=('pylint')
_pkgname=pylint
source=("http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('7819fec3ce3e720f30e508b8a88cf59b')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root=$pkgdir/ --prefix=/usr --optimize=1
}

# vim:set ts=4 sw=4 et:
