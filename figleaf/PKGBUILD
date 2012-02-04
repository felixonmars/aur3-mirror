# Contributor: Adam Mckaig <adam.mckaig@gmail.com>
# vim: ts=4 sts=4 et sw=4

pkgname=figleaf
pkgver=0.6.1
pkgrel=1
pkgdesc="Python code coverage analysis tool. A minimal replacement for coverage.py."
arch=("any")
url="http://pypi.python.org/pypi/figleaf/$pkgver"
license=("BSD")
depends=("python")
options=(!emptydirs)
source=("http://darcs.idyll.org/~t/projects/figleaf-$pkgver.tar.gz")
md5sums=("35bc1341ba7e89700a0f330f04b09141")
install=

build() {
    cd $srcdir/figleaf-$pkgver
    python setup.py install --root=$pkgdir --optimize=1 || return 1
}

