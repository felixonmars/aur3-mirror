# Maintainer: Felix Schindler <felix at schindlerfamily dot de>

pkgname=python2-pymor
_pkgname=pyMOR
pkgver=0.2.0
pkgrel=3
pkgdesc="Model Order Reduction with Python"
url="http://pymor.org"
arch=('any')
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib'
         'python2-opengl' 'python2-pyside' 'python2-glumpy' 'python2-pytest'
         'python2-pytest-cache' 'python2-docopt')
makedepends=('python2-distribute cython2')
source=(https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('31b7351bf63cfac36b036309613abc19')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build build_ext
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
