# Maintainer: Ishan Arora <ishanarora@gmail.com>

pkgname=python-deap
pkgver=0.9.1
pkgrel=1
pkgdesc="Distributed Evolutionary Algorithms in Python"
arch=('any')
url="http://deap.googlecode.com/"
license=('LGPL')
depends=('python')
source=("https://deap.googlecode.com/files/deap-$pkgver.tar.gz")
md5sums=('96c5bba951249ae98768165f027ccbbb')

package() {
  cd "$srcdir/deap-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
