# Maintainer: Mat Marini mat.marini (at) gmail.com

pkgname=bjptools
pkgver=090908
pkgrel=1
pkgdesc="Mapping tools for Quake-engine games.  Contains treeqbsp, light, and vis."
arch=('i686' 'x68_64')
url="http://www.quaddicted.com/tools/bjptools-090908.txt"
license=('GPL2')
makedepends=('unzip')
md5sums=('46e7f9197400c39ef755a8095d3d8b69')

source=(http://quaddicted.com/tools/bjptools-$pkgver.zip)

build(){
	cd "$srcdir/bjptools"

	make all
}

package(){
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/bjptools/bin/* $pkgdir/usr/bin
}
