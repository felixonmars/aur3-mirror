# Maintainer: Diego Mascialino <diego@gcoop.coop>

pkgname=python2-zope-testbrowser
pkgver=4.0.2
pkgrel=2
pkgdesc="Programmable browser for functional black-box tests"
url="http://pypi.python.org/pypi/zope.testbrowser"
depends=('python2' 'python2-mechanize' 'python2-zope-interface' 'zope-schema' 'python2-pytz')
makedepends=('python2-distribute' )
license=('ZPL 2.1')
arch=('any')
source=('http://pypi.python.org/packages/source/z/zope.testbrowser/zope.testbrowser-4.0.2.tar.gz')
md5sums=('c18a524d48bd8c985478f2327f515b31')

build() {
    cd $srcdir/zope.testbrowser-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/zope.testbrowser-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1 
}
