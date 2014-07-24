# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>
pkgname=python2-subprocess32
pkgver=3.2.6
pkgrel=1
pkgdesc="backport of the Python 3.2 subprocess module for use on Python versions 2.4 through 2.7"
arch=('any')
url="https://code.google.com/p/python-subprocess32/"
license=('Python')
groups=()
depends=('python2')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/s/subprocess32/subprocess32-$pkgver.tar.gz)
md5sums=('754c5ab9f533e764f931136974b618f1')

package() {
  cd "$srcdir/subprocess32-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
