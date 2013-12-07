# Maintainer: Mariano Iglesias <mgiglesias@gmail.com>
pkgname=python-pyfire
pkgver=0.3.4
pkgrel=3
pkgdesc='A Python implementation of the Campfire API'
arch=('i686' 'x86_64' 'ppc')
url='https://github.com/mariano/pyfire'
license=('MIT')
depends=('python2' 'twisted>=10.1.0' 'python2-pyopenssl')
optdepends=()
makedepends=('python2' 'python2-distribute')
source=(http://pypi.python.org/packages/source/p/pyfire/pyfire-$pkgver.tar.gz)
md5sums=('990fd05c8e69cbbcacd0657e3214565e')

build() {
    cd "$srcdir/pyfire-$pkgver"
    python2 setup.py build || return 1
}

package() {
    cd "$srcdir/pyfire-$pkgver"
    python2 setup.py install  -O1 --skip-build --root="$pkgdir" || return 1
}
