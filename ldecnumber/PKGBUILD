# Maintainer: Lucas Hermann Negri <kkndrox@gmail.org>

pkgname=ldecnumber
pkgver=21
pkgrel=2
pkgdesc="decNumber binding for Lua" 
arch=(i686 x86_64)
url="http://luaforge.net/projects/ldecnumber/" 
depends=('lua>=5.1') 
makedepends=('gcc')
license=(MIT)
source=(http://luaforge.net/frs/download.php/2551/ldecNumber-21.tar.gz)
md5sums=('da693856a04485a0ab6d96136fa7c421')

build() { 
	cd $startdir/src/ldecNumber-$pkgver
	make || 1
	mkdir -p $startdir/pkg/usr/lib/lua/5.1
	cp ldecNumber.so $startdir/pkg/usr/lib/lua/5.1 || 1
}
