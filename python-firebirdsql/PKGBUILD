# Maintainer: Libernux <dutchman55@gmx.com>
pkgname=python-firebirdsql
pkgver=0.9.3
pkgrel=1
pkgdesc="A Python interface for the Firebird RDBMS."
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/firebirdsql"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/f/firebirdsql/firebirdsql-$pkgver.tar.gz")
md5sums=('aedae075d2bd512db5925875132b12cd')

package() {
  cd $srcdir/firebirdsql-$pkgver
  python setup.py install --root=$pkgdir 
}
