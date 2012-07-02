# Contributor: v2punkt0 <v2punkt0@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=pysearch
pkgver=3.1
pkgrel=2
pkgdesc="This python module implements a set of classes and functions to work with the Yahoo Search Web Services"
url="http://pysearch.sourceforge.net"
license=('BSD')
arch=('i686')
depends=('python2')
source=(http://downloads.sourceforge.net/$pkgname/pYsearch-$pkgver.tar.gz)
md5sums=('03a3cf75044bc00cee5b61130aa06926')

package()
{
  cd $srcdir/pYsearch-$pkgver
  python2 setup.py install --prefix=$pkgdir/usr
}

