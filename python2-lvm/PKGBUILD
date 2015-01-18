# Contributor: Jérôme Poulin <jeromepoulin@gmail.com>

pkgname=python2-lvm
pkgver=0.1
pkgrel=0
pkgdesc="Python package with bindings to LVM."
arch=('i686' 'x86_64')
url="http://code.google.com/p/python-lvm/"
license=('BSD')
depends=('python2' 'python2-distribute')
source=(http://python-lvm.googlecode.com/files/python-lvm-$pkgver.tar.gz)
md5sums=('27a5a1b7d1f2f864044c35a9fa7a36bf')

build() {
    cd "$srcdir/python-lvm-$pkgver/"
    python2 ./setup.py build
}

package() {
    cd "$srcdir/python-lvm-$pkgver/"
    python2 ./setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
