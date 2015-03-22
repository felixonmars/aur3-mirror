# Maintainer: Ashley Whetter <(firstname) at awhetter couk>
pkgname=python2-pastescript
pkgver=1.7.5
pkgrel=1
pkgdesc="A pluggable command-line frontend, including commands to setup package file layouts"
arch=(any)
url="https://pypi.python.org/pypi/PasteScript"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/P/PasteScript/PasteScript-${pkgver}.tar.gz)
md5sums=(4c72d78dcb6bb993f30536842c16af4d)

package() {
  cd "$srcdir/PasteScript-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
