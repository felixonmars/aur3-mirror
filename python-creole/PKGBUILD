# Maintainer: Devaev Maxim <mdevaev@gmail.com>

pkgname=python-creole
pkgver=1.0.6
pkgrel=1
pkgdesc="Python lib for converting between HTML and Creole markup"
arch=('any')
url="http://code.google.com/p/python-creole"
license=('GPL3')
depends=('python2')
makedepends=('python2-distribute')
options=(!emptydirs)
source=( "http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")

build() {
    cd $srcdir/$pkgname-${pkgver}
    python2 setup.py install --root=$pkgdir/ --optimize=1
}

md5sums=('049bb9c0d1f16303195a7726b1fcd080')
