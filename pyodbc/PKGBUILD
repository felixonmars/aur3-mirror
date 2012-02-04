# Contributor: Ali H. Caliskan <ali.h.caliskan//gmail.com>
# Maintainer: Jared <rakmos@gmx.com>

pkgname=pyodbc
pkgver=2.1.11
pkgrel=1
pkgdesc="Python ODBC module that allows you to connect to almost any database."
arch=('i686' 'x86_64')
url="http://code.google.com/p/pyodbc"
license=('MIT')
depends=('python>=2.4', 'unixodbc')
source=("http://pyodbc.googlecode.com/files/pyodbc-$pkgver.zip")
md5sums=('f8f62b725fbd88f4ba5bca288ae7d697')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py build
  python2 setup.py install --root=$startdir/pkg
}

