# Contributor: Lucas Hermann Negri <kkndrox@gmail.com>

pkgname=coxpcall
pkgver=1.13.0
pkgrel=1
pkgdesc="Encapsulates the protected calls with a coroutine based loop." 
arch=(i686 x86_64)
url="http://coxpcall.luaforge.net/" 
depends=('lua')
license=(CUSTOM)
source=(http://luaforge.net/frs/download.php/3406/$pkgname-$pkgver.tar.gz)
md5sums=('d3e0554dc426a7a24e372780b3dd5fe6')

build() { 
	cd $startdir/src/$pkgname-$pkgver 
	./configure lua
	make install LUA_DIR=$startdir/pkg/usr/share/lua/5.1 || return 1
}
