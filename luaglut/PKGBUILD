# Maintainer: Lucas Hermann Negri <kkndrox@gmail.org>

pkgname=luaglut
pkgver=0.5
pkgrel=2
pkgdesc="OpenGL and GLUT bindings to Lua" 
arch=(i686 x86_64)
url="http://lua-users.org/files/wiki_insecure/users/VarolKaptan/" 
depends=('freeglut' 'lua>=5.1') 
makedepends=('gcc')
license=(LGPL)
source=(http://lua-users.org/files/wiki_insecure/users/VarolKaptan/$pkgname-$pkgver.tar.gz)
md5sums=('9b0ae78d829af770dab2b88c9190c90c')

build() { 
	cd $startdir/src/$pkgname-$pkgver
	make || 1
	mkdir -p $startdir/pkg/usr/lib/lua/5.1 || 1
	cp $startdir/src/$pkgname-$pkgver/{luagl,luaglut,memarray}.so $startdir/pkg/usr/lib/lua/5.1 || 1
}
