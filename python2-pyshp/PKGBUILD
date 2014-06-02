# Maintainer: Rich Li <rich at dranek com>
pkgname=python2-pyshp
_pkgname=pyshp
pkgver=1.2.1
pkgrel=1
pkgdesc="Python read/write support for ESRI Shapefile format"
arch=('any')
url="https://pypi.python.org/pypi/pyshp"
license=('MIT')
depends=('python2' 'python2-setuptools')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('156654b3c7878c4a31d27e4b9dc34377')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
