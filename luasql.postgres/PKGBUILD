# $Id: PKGBUILD,v 1.14 2008/03/14 23:25:43 varun Exp $
# Maintainer: William Rea <sillywilly@gmail.com>

pkgname=luasql.postgres
pkgver=2.1.1
pkgrel=1
pkgdesc="Lua bindings to postgresql"
arch=('i686' 'x86_64')
url="http://www.keplerproject.org/luasql/"
license=('MIT')
depends=('lua' 'postgresql')
makedepends=('gcc')
source=(http://luaforge.net/frs/download.php/2686/luasql-$pkgver.tar.gz config.new)
md5sums=('63bdd57de4b9d1be336ba112d8cb69eb' '6307e923d9a3c5e446eea5e1780c2c32')

build() {
  cd $startdir/src/luasql-$pkgver
  cp ../config.new config
  make || return 1
  mkdir -p $startdir/pkg/usr/lib/lua/5.1/luasql
  cp src/postgres.so $startdir/pkg/usr/lib/lua/5.1/luasql
}
