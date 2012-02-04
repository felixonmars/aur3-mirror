# Contributor: Lucas Hermann Negri <kkndrox@gmail.com>

pkgname=wsapi
pkgver=1.5
pkgrel=1
pkgdesc="API that abstracts the web server from Lua web applications." 
arch=(i686 x86_64)
url="http://wsapi.luaforge.net/" 
depends=('lua' 'luafilesystem' 'rings' 'coxpcall' 'fcgi')
provides=('lfcgi')
license=(CUSTOM)
source=(http://github.com/downloads/keplerproject/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5c983a1db3659ed73e28c473ffd4f4d5')

build() { 
	cd $startdir/src/$pkgname-$pkgver 
	./configure lua
	make || return 1
	mkdir -p $startdir/pkg/usr/{share,lib}/lua/5.1
	mkdir -p $startdir/pkg/usr/bin
	make install install-fcgi LUA_DIR=$startdir/pkg/usr/share/lua/5.1 \
		LUA_LIBDIR=$startdir/pkg/usr/lib/lua/5.1 \
		BIN_DIR=$startdir/pkg/usr/bin/ || return 1
	
}
