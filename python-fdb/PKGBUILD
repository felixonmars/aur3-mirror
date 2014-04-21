# Maintainer: Libernux <dutchman55@gmx.com>
pkgname=python-fdb
pkgver=1.4
pkgrel=1
pkgdesc="A Python interface for the Firebird RDBMS (replaces kinterbasdb)."
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/fdb"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/f/fdb/fdb-$pkgver.tar.gz")
md5sums=('a9934fd8004467ac69682e5b09e272c8')

package() {
  cd $srcdir/fdb-$pkgver
  python setup.py install --root=$pkgdir 
  install -D -m644 $srcdir/fdb-$pkgver/LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT
}
