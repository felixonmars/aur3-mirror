# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Martin Ortbauer <mortbauer@gmail.com>
pkgname=python-opster
pkgver=4.1
pkgrel=1
pkgdesc="command line parsing speedster"
arch=('any')
url="https://pypi.python.org/pypi/opster"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/o/opster/opster-${pkgver}.tar.gz")
md5sums=('3fb50a62f5fa43a0521063daf8189316')

package() {
  cd "$srcdir/opster-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
