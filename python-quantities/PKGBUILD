# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-quantities
pkgver=0.10.1
pkgrel=2
pkgdesc="Support for physical quantities based on the popular numpy library"
url="http://packages.python.org/quantities"
arch=('any')
license=('BSD')
depends=('python-numpy' 'python-nose')
source=(http://pypi.python.org/packages/source/q/quantities/quantities-${pkgver}.tar.gz)
md5sums=('e924e21c0a5ddc9ebcdacbbe511b8ec7')


build() {
  cd $srcdir/quantities-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/quantities-$pkgver
  python setup.py install --prefix=/usr --root=$pkgdir
}
