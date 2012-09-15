# Maintainer: Cameron Banta <cbanta@gmail.com>
pkgname=lua-alt-getopt
pkgver=0.7.0
pkgrel=2
pkgdesc="Lua module for processing options similar to getopt_long(3)"
license=('MIT')
arch="any"
url="http://luaforge.net/projects/alt-getopt/"
depends=('lua')
source=(http://mova.org/~cheusov/pub/lua_alt_getopt/lua-alt-getopt-$pkgver.tar.gz)

build() {
	echo
}

package() {
  cd "$srcdir"
  cd $pkgname-$pkgver
	install -Dm0664 alt_getopt.lua \
		$pkgdir/usr/share/lua/5.1/alt_getopt.lua
}
md5sums=('f504578b1287ea02759add231b972812')
