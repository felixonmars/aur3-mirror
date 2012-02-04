# Maintainer: Thomas S Hatch <thatch45@gmail.com>
pkgname=python2-pdbpp
pkgver=0.7
pkgrel=1
pkgdesc="pdb++, a drop-in replacement for pdb"
arch=(any)
url="http://pypi.python.org/pypi/pdbpp/"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/p/pdbpp/pdbpp-$pkgver.tar.gz")
md5sums=('c8f982f01d42b93294289e6ca78122d8')

build() {
  cd "$srcdir/pdbpp-$pkgver"
  python2 setup.py build install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
