# Maintainer: Ishan Arora <ishanarora@gmail.com>

pkgname=python2-inspyred
pkgver=1.0
pkgrel=2
pkgdesc="A framework for creating bio-inspired computational intelligence algorithms in Python."
arch=('any')
url="http://inspyred.github.com"
license=('GPL')
depends=('python2')
source=("https://pypi.python.org/packages/source/i/inspyred/inspyred-$pkgver.tar.gz")
md5sums=('f1ed3898ec0056a950a6b54e04f0b8b4')

package() {
  cd "$srcdir/inspyred-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
