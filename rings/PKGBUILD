# Contributor: Lucas Hermann Negri <kkndrox@gmail.com>

pkgname=rings
pkgver=1.2.3
pkgrel=1
pkgdesc='Library which provides a way to create new Lua states from within Lua.' 
arch=(i686 x86_64)
url='http://keplerproject.github.com/rings/' 
depends=('lua') 
license=(CUSTOM)
source=("http://github.com/keplerproject/rings/tarball/v$pkgver")
md5sums=('1ac602984fe2112e231a28804f1c54d0')

build() { 
	cd $startdir/src/keplerproject-rings-8972089 
	./configure lua || return 1
	make || return 1
	make install PREFIX=$startdir/pkg/usr/
}
