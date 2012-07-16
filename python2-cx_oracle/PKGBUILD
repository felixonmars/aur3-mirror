# Contributor: Michael Kapelko <kornerr@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: David H. Bronke <whitelynx@gmail.com>
pkgname=python2-cx_oracle
pkgver=5.1.2
pkgrel=1
pkgdesc="Python extension module that allows access to Oracle databases"
arch=('i686' 'x86_64')
url=('http://cx-oracle.sourceforge.net/')
license=('custom')
depends=('python2' 'oracle-instantclient-sdk')
source=(http://downloads.sourceforge.net/cx-oracle/cx_Oracle-$pkgver.tar.gz)
md5sums=('462f309e00f7bff7100e2077fc43172c')

build() {
  cd $srcdir/cx_Oracle-$pkgver
  python2 setup.py install --root=$pkgdir || return 1
  # Install license.
  install -D -m 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

