# Maintainer: archtux <antonio.arias99999 at gmail.com>

pkgname=pytrailer
pkgver=0.6.0
pkgrel=2
pkgdesc="Python library to simplify access to movies on apple.com/trailers"
url="http://pypi.python.org/pypi/pytrailer/"
arch=('any')
license=('GPL3')
depends=('python2')
source=("http://pypi.python.org/packages/source/p/pytrailer/pytrailer-$pkgver.tar.gz")
md5sums=('9ac94e2c74b5f37a38a5ad8db49d2057')

build() {
  cd $srcdir/$pkgname-$pkgver

  python2 setup.py install --root $pkgdir
}