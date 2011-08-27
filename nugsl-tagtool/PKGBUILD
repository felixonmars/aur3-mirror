# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>

pkgname=nugsl-tagtool
pkgver=1.5
pkgrel=1
pkgdesc="Apply a function to balanced XML tag environments."
arch=('i686')
url="http://gsl-nagoya-u.net/appendix/software/tagtool/"
license=('GPL')
conflicts=()
depends=('python')
source=(http://gsl-nagoya-u.net/appendix/software/tagtool/$pkgname-$pkgver.tgz)
md5sums=('d32d878fd9881f4bfe255e2d6b833dd7')


build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py bdist
  tar -xf dist/$pkgname-$pkgver.linux-i686.tar.gz -C $pkgdir
  rm $pkgdir/usr/lib/python2.6/site-packages/nugsl/__init__.py{,c}
}
