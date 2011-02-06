# Maintainer: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Anders Bergh <anders1 at gmail dot com>

pkgname=luasql-sqlite3
pkgver=2.1.1
pkgrel=3
pkgdesc='sqlite3 module for Lua'
arch=(i686 x86_64 ppc)
url='http://www.keplerproject.org/luasql/'
license=('MIT')
depends=('lua' 'sqlite3')
source=("http://luaforge.net/frs/download.php/2686/luasql-$pkgver.tar.gz")
md5sums=('63bdd57de4b9d1be336ba112d8cb69eb')

build() {
  cd $srcdir/luasql-$pkgver
  make T=sqlite3 PREFIX=/usr DRIVER_LIBS=-lsqlite3 DRIVER_INCS= \
   CC='gcc -fPIC'
  install -Dm0644 src/sqlite3.so $pkgdir/usr/lib/lua/5.1/luasql/sqlite3.so
  install -Dm0644 doc/us/license.html \
   $pkgdir/usr/share/licenses/$pkgname/license.html
}
