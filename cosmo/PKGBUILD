# Contributor: Lucas Hermann Negri <kkndrox@gmail.com>
# Maintainer: Andreas Baumann <abaumann@yahoo.com>

pkgname=cosmo
pkgver=9.09.22
pkgrel=1
pkgdesc="Safe templates engine for Lua" 
arch=(i686 x86_64)
url="http://cosmo.luaforge.net/" 
depends=('lua')
license=(CUSTOM)
source=(http://cosmo.luaforge.net/$pkgname-$pkgver.tar.gz)
md5sums=('ae0ea6af342089e3ede1ba48ded8e138')

build() { 
	cd $startdir/src/$pkgname-$pkgver 
	./configure lua
	make install LUA_DIR=$startdir/pkg/usr/share/lua/5.1 || return 1
}
