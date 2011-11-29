# Contributor: Michael Kapelko <kornerr@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=cx_oracle
pkgver=5.1.1
pkgrel=1
pkgdesc="Python extension module that allows access to Oracle databases"
arch=('i686' 'x86_64')
url=('http://cx-oracle.sourceforge.net/')
license=('custom')
depends=('python2' 'instantclient-sdk')
source=(http://downloads.sourceforge.net/cx-oracle/cx_Oracle-$pkgver.tar.gz)
md5sums=('ac7949c41392459f187cadf65907c97b')

build() {
  cd $srcdir/cx_Oracle-$pkgver
  ORACLE_HOME=/opt/instantclient python2 setup.py install --root=$pkgdir || return 1
  # Install license.
  install -D -m 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

