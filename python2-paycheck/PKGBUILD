# Maintainer: spider-mario <spidermario@free.fr>
_pyname=paycheck
pkgname=python2-$_pyname
pkgver=0.4.5
pkgrel=1
pkgdesc="Testing library for Python, inspired by QuickCheck and ScalaCheck."
arch=('any')
url="http://pypi.python.org/pypi/$_pyname/"
license=('custom:ISC')
depends=('python2')
options=(!emptydirs)
source=(http://pypi.python.org/packages/any/p/paycheck/paycheck-0.4.5.linux-x86_64.tar.gz)
md5sums=(f68af5ab700aaa7ad7529bda21ea2d94)

package() {
  cd "$srcdir/usr/local/lib/python2.7/dist-packages/"

  install --directory "$pkgdir/usr/lib/python2.7/site-packages/"
  cp --recursive * "$pkgdir/usr/lib/python2.7/site-packages/"
}

# vim:set ts=2 sw=2 et:
