# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=nghost2
pkgver=2.0.2
pkgrel=2
pkgdesc="A media center frontend for car PC type systems."
arch=('i686' 'x86_64')
makedepends=('libxml++' 'sdl_ttf' 'sdl_gfx' 'libnghost')
url=('http://sourceforge.net/projects/nghost/')
license="GPL3"
source=('http://downloads.sourceforge.net/project/nghost/nghost-2/nghost-2.0.2/nghost2-2.0.2.tar.gz')
md5sums=('b8ef4f36bc1186fb9aace03a041b767c')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure
	# some patches to get it compiled
	sed -i '62iint creturn;' src/nscan/nscan.cpp
	sed -i 's/dup(i);/creturn = dup(i);/g' src/nscan/nscan.cpp
	sed -i 's/popen/freturn = popen/' src/event.cpp
	sed -i '36iFILE *freturn;' src/event.cpp
	sed -i '51ireturn arg;' src/localactionhandler.cpp
	make
} 
package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install || return 1
}
