# Maintainer: spider-mario <spidermario@free.fr>
_pyname=paycheck
pkgname=python-$_pyname
pkgver=1.0.2
pkgrel=1
pkgdesc="Testing library for Python, inspired by QuickCheck and ScalaCheck."
arch=('any')
url="http://pypi.python.org/pypi/$_pyname/"
license=('custom:ISC')
depends=('python')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/p/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=(e42a3032221bc56ae9382159cd6a3807)

package() {
  cd "$srcdir/$_pyname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  install --directory "$pkgdir/usr/share/licenses/$pkgname/"
  install --mode=644 \
    LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
