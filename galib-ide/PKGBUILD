# Contributor: Lucas Hermann Negri <kkndrox@gmail.org>

pkgname=galib-ide
pkgver=0.11.1
pkgrel=1
pkgdesc="IDE with Qt interface for building GAs based in GAlib library" 
arch=(i686 x86_64)
url="http://sourceforge.net/projects/galib-ide/" 
depends=('qt' 'galib') 
makedepends=('gcc')
license=(GPL)
source=(http://downloads.sourceforge.net/galib-ide/$pkgname-$pkgver.tar.bz2)
md5sums=('61bc5c50cacbbafb3a7e14b2fe9154e0')

build() { 
	cd $startdir/src/$pkgname-$pkgver
	qmake
	make
	mkdir -p $startdir/pkg/usr/bin
	cp galib-ide $startdir/pkg/usr/bin
}
