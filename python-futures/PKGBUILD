# Maintainer: Pierre Bourdon <delroth@gmail.com>

pkgname=python-futures
pkgver=1.0
pkgrel=2
pkgdesc="Java-style futures implementation in Python"
arch=(i686 x86_64)
url="http://code.google.com/p/pythonfutures/"
license=("BSD")
depends=('python2')
source=(http://pypi.python.org/packages/source/f/futures/futures-$pkgver.tar.gz)
md5sums=('0171acd9e2486915ccbe3d0e2e92ec3f')

build() {
     cd $srcdir/futures-$pkgver
     python2 setup.py install --optimize=1 --root=$pkgdir
}
