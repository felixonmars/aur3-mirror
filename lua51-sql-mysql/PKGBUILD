# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=lua51-sql-mysql
pkgdesc='MySQL module for Lua 5.1'
pkgver=2.2.0
pkgrel=3
arch=('i686' 'x86_64')
url='http://www.keplerproject.org/luasql/'
license=('MIT')
depends=('lua51' 'libmariadbclient')
source=("https://github.com/downloads/keplerproject/luasql/luasql-$pkgver.tar.gz")
md5sums=('59d72db444c6369c936d4f03694db6b7')

build() {
  cd luasql-$pkgver
  sed -i '24s,$,/lua5.1,' config
  msg2 'Building MySQL support'
  make T=mysql PREFIX=/usr DRIVER_LIBS="$(mysql_config --libs)" \
    DRIVER_INCS="$(mysql_config --include) -fPIC"
}

package() {
  cd luasql-$pkgver
  install -Dm644 src/mysql.so "$pkgdir/usr/lib/lua/5.1/luasql/mysql.so"
  install -Dm644 doc/us/license.html "$pkgdir/usr/share/licenses/$pkgname/license.html"
}

# vim:set ts=2 sw=2 et:
