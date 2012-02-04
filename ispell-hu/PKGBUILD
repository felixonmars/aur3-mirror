# Contributor: Peter Avramucz <muczy@freestart.hu>
pkgname=ispell-hu
pkgver=1.5
pkgrel=1
pkgdesc="Hungarian dictionary for ispell."
arch=('i686' 'x86_64')
url="http://magyarispell.sourceforge.net/"
license=('GPL' 'GPL3' 'LGPL' 'MPL')
depends=('ispell')
makedepends=('awk' 'm4')
source=(http://downloads.sourceforge.net/sourceforge/magyarispell/magyarispell-$pkgver.tar.gz)
md5sums=('17c2ea6ef5f8c1b722046e7c5cd6da75')

build() {
	cd $srcdir/magyarispell-$pkgver

	# Fix awk location
	sed 's/\/usr\/bin\/awk/\/bin\/awk/g' -i config

	# Uncomment ispell target, so everything can be built
	sed 's/#ispell: magyar4ispell.hash/ispell: magyar4ispell.hash/g' -i Makefile

	# Note: package is not compatible with parallel compiling
	#export MAKEFLAGS="-j1"
	make -j1 all || return 1

	mkdir -p "$startdir/pkg/usr/lib/ispell"
	cp $startdir/src/magyarispell-$pkgver/*.aff $startdir/pkg/usr/lib/ispell/
	cp $startdir/src/magyarispell-$pkgver/*.dic $startdir/pkg/usr/lib/ispell/
}

# vim:set ts=2 sw=2 et:

