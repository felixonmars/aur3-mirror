# Current Maintainer: Pengyu CHEN <cpy.prefers.you@gmail.com>
pkgname=pymssql
pkgver=2.0.0b1_dev_20130403
pkgrel=1
pkgdesc="A fast MS SQL Server client library for Python directly using C API instead of ODBC. It is Python DB-API 2.0 compliant. Works on Linux, *BSD, Solaris, Mac OS X and Windows."
arch=('i686' 'x86_64')
url="http://code.google.com/p/pymssql/"
license=('LGPL')
depends=('gcc' 'python2>=2.5' 'cython2>=0.13' 'freetds>=0.82')
source=(http://pymssql.googlecode.com/files/$pkgname-${pkgver//_/-}.tar.gz)
sha1sums=('a9abaf128e704a2837e833501b956156e25925e4')

package() {
  cd $srcdir/$pkgname-${pkgver//_/-}
  python2 setup.py install --root="$pkgdir"
}
