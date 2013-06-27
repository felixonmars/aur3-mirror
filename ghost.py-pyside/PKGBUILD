# $Id$
# Maintainer: Diep Pham Van <imeo@favadi.com>
# Contributor: Fabien Devaux <fdev 31 @ gmail dot com>
# Contributor: Chris Longo <chris . longo @ gmail dot com>

pkgname=ghost.py-pyside
_uc_pkg=Ghost.py
pkgver=0.1b2
pkgrel=1
pkgdesc="Webkit based webclient (relies on PySide)"
arch=('any')
url="http://jeanphix.github.com/$_uc_pkg/"
license=('MIT')
depends=('python2' 'python2-pyside')
makedepends=('python2-distribute')
source=(remove_PyQt4_support.patch http://pypi.python.org/packages/source/G/$_uc_pkg/$_uc_pkg-$pkgver.tar.gz)
md5sums=('516c410723740839762e82ecdfe6738f'
         '53412b0c8691c3b404586c0baf47c612')

build() {
    # Remove PyQT4 support
    cp remove_PyQt4_support.patch $_uc_pkg-$pkgver/ghost
    cd $_uc_pkg-$pkgver/ghost
    patch -R -p0 < remove_PyQt4_support.patch

    # The real work here
    cd ..
    python2 setup.py build || exit 1
    python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
