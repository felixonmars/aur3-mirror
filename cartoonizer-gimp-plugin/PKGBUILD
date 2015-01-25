# Contributor: Tibor Bamhor <tiborb95 at gmail.com>

pkgname=cartoonizer-gimp-plugin
pkgver=0.8.5
pkgrel=2
pkgdesc="Cartoonizer and Color Reducer. Reduces number of colors in an image. Draws lines. A lot of options."
url="http://code.google.com/p/cartooner-color-reducer/"
license="GPL3"
arch=('i686' 'x86_64')
depends=(gimp)
#makedepends=()
source=(http://cartooner-color-reducer.googlecode.com/files/cartoonizer-${pkgver}.tgz)

build() {
	export LDFLAGS="$LDFLAGS -lm"
	
	cd ${srcdir}/cartoonizer
	
	gimptool-2.0 --build cartoonizer.c
}

package() {

	cd ${srcdir}/cartoonizer	

	#copying file into pkgdir to be packed
	mkdir -p $pkgdir/usr/lib/gimp/2.0/plug-ins/
	
	install -m 755 cartoonizer $pkgdir/usr/lib/gimp/2.0/plug-ins/ 
	
}

sha1sums=('b48b5c59c6dd1840361890464828f1bbf54ce718') 
