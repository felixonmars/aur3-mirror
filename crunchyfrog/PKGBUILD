# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=crunchyfrog
pkgver=0.4.2
pkgrel=2
pkgdesc="SQL editor and database schema browser for the GNOME desktop"
arch=(i686 x86_64)
url=http://code.google.com/p/crunchyfrog
license=(GPL3)
depends=(kiwi pygtksourceview2 python2-cairo python2-configobj python2-dbus python2-lxml
    python2-sexy python2-sphinx python2-sqlparse python2-xdg)
makedepends=(python2-setuptools)
optdepends=('mysql-python: To handle MySQL Databases',
    'python-psycopg2: To handle PostgreSQL Databases',
    'python-pysqlite: To handle SQLite Databases',
    'pymssql: To handle Microsoft SQL Server Databases',
    'kinterbasdb: To handle Firebird Databases'
    'informixdb: To handle Informix Databases'
    'sapdb: To handle MaxDB'
    'ipython: To use built-in python shell')
[[ $CARCH == i686 ]] && optdepends+=('cx_oracle: To handle Oracle Databases')
source=(http://crunchyfrog.googlecode.com/files/$pkgname-$pkgver.tar.gz
    build-mo.patch)
sha256sums=('6ac6f8c6fd38dc674eecd8f0e5c787bf580f894dd7cba61ef801d1eb3fea6444'
    'cea66de44986fcfa6afdaea72450444d0e11d7f5c2e0126958fbf7d89a135a99')
sha512sums=('945aba9701540263386cfc3b2f071013d606d4065d403308a56b09052a9e84dbb2f3658f85639701b199775213ec1fbd64e83018fcbec1524d261bb922591591'
    'da2cecfeae15a0de553982e3a89cf7ddb93571f2fd1ecfacfcf55a23a9efb932e8dbe40081bd8c34a4d75ecbb30382d1282e0b646d8ec38fb9a9a6a7cbb0db3b')

prepare() {
    sed -i 's:^#!/usr/bin/env python$:&2:' $pkgname-$pkgver/$pkgname
}

build() {
    cd $pkgname-$pkgver/
    python2 setup.py build
}

package() {
    cd $pkgname-$pkgver/
    python2 setup.py install --root="$pkgdir" --optimize=1
}
