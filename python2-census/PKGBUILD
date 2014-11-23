# Maintainer: Your Name <youremail@domain.com>
_pkgname=census
pkgname=python2-$_pkgname
pkgver=0.6
pkgrel=1
pkgdesc="A python wrapper for the Census API"
arch=("any")
url="http://pypi.python.org/pypi/census"
license=('BSD')
depends=('python2-us' 'python2-requests')
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('797c257c1477af8e01c184ae92cd64cd')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
