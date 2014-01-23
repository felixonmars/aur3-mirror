# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=libnghost
pkgver=2.0.2
pkgrel=2
pkgdesc="A library for the nghost car PC type systems media center frontend."
arch=('i686' 'x86_64')
makedepends=('libxml++' 'sdl_ttf' 'sdl_gfx')
url="http://www.openice.org"
license="GPL3"
source=('http://downloads.sourceforge.net/project/nghost/nghost-2/nghost-2.0.2/libnghost-2.0.2.tar.gz')
sha512sums=("7a7b3caa30e65bb6e77541561b000a1af17b527726179b6354790ee92322bfb6410ea500054cf5d37fa479bf36168c2b40bb67e0de77d7c1af30bd012618cf9c")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure
	#some patche to make it compile
	sed -i '25i#include <cstdio>' src/log/ndebug.h
	sed -i '24i#include <cstdio>' src/plugins/interface/plugin_database.h
  	make
} 
package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
        make DESTDIR="$pkgdir" install
	mkdir $pkgdir/usr/lib
	mv $pkgdir/usr/local/lib/pkgconfig $pkgdir/usr/lib
}
