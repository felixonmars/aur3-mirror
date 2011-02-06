# Maintainer: Dan Vratil <progdan@progdansoft.com>

pkgname=plasmoid-openbrain
pkgver=0.0.2.6.4
pkgrel=1
pkgdesc="An artificial intelligence desktop assistant"
arch=('i686' 'x86_64')
url="http://openbrain.sourceforge.net"
license=('GPLv3')
depends=('qt>=4.4' 'kdelibs>=4.2')
makedepends=('cmake' 'make' 'xerces-c' 'boost')
source=(http://voxel.dl.sourceforge.net/sourceforge/openbrain/openbrain-$pkgver.tar.bz2)

build() {
	cd $startdir/src/openbrain
	
	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('17a0a995a0e4f05cb47342e5b9e2aafd')
