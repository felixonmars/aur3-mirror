# Maintained by: Thomas Zervogiannis <tzervo@gmail.com>

pkgname=tk-togl
pkgver=2.0
pkgrel=1
pkgdesc="A Tcl/Tk widget for OpenGL rendering."
depends=('tk' 'freeglut')
conflicts=('tk-togl-legacy-netgen')
arch=('any')
license=('BSD')
url="http://togl.sourceforge.net"
source=(http://downloads.sourceforge.net/project/togl/Togl/$pkgver/Togl$pkgver-src.tar.gz)

md5sums=('64d385c59b8cb31b9d2c921d0cc37503')

build() {
	cd $startdir/src/Togl$pkgver
	sed -i '/tclInt.h/s/generic\///' ./configure
	sed -i '/tkInt.h/s/generic\///' ./configure
	./configure --prefix=/usr
	sed -i '/INCLUDES/s/\/generic/\/tk-private\/generic/' ./Makefile
	make DESTDIR=$startdir/pkg install	
}
