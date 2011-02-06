# Contributor: Lucas Hermann Negri <kkndrox@gmail.com>

pkgname=orbit
pkgver=2.0.2
pkgrel=1
pkgdesc="MVC web framework for Lua" 
arch=(i686 x86_64)
url="http://orbit.luaforge.net/" 
depends=('wsapi' 'cosmo')
license=(CUSTOM)
source=(http://luaforge.net/frs/download.php/3975/$pkgname-$pkgver.tar.gz)
md5sums=('9ff095b915825ea9dd731b20c3772c2e')

build() { 
	cd $startdir/src/$pkgname-$pkgver 
	./configure lua
	make install LUA_DIR=$startdir/pkg/usr/share/lua/5.1 \
		BIN_DIR=$startdir/pkg/usr/bin || return 1
}
