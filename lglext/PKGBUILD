# Maintainer: Lucas Hermann Negri <kkndrox@gmail.org>

pkgname=lglext
pkgver=0.1.0
pkgrel=2
pkgdesc="GtkGLExt Lua" 
arch=(i686 x86_64)
url="http://oproj.tuxfamily.org" 
depends=('lgui>=0.20' 'lua>=5.1' 'luaglut>=0.5') 
makedepends=('gcc')
license=(LGPL)
source=(http://download.tuxfamily.org/oproj/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('12dd97453731d8b526b912159ecab998')

build() { 
	cd $startdir/src/$pkgname-$pkgver
	
	if [ $arch = 'x86_64' ]; then
		make AMD64=1 || 1
	else
		make || 1
	fi
	
	make install DESTDIR=$startdir/pkg || 1
}
