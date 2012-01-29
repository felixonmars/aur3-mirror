# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=nghost3
pkgver=3
pkgrel=1
pkgdesc="A prototype media center frontend for car PC type systems."
arch=('i686' 'x86_64')
url="https://github.com/BillyGalbreath/nGhost3"
license="unknown"
makedepends=('qt')

build() {
	cd $srcdir	
	git clone https://github.com/BillyGalbreath/nGhost3.git
	cd nGhost3
	qmake ng3.pro -o Makefile
	make
} 
package() {
	cd $srcdir/nGhost3
	make INSTALL_ROOT="$pkgdir" DESTDIR="$pkgdir" install || return 1
}
