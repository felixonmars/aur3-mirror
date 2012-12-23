# Contributor: Tibor Bamhor <tiborb95 at gmail.com>

pkgname=colorblur-gimp-plugin
pkgver=0.3.4
pkgrel=1
pkgdesc="Color-based blur. Similar to standard Selective Blur plugin but with more options. Intended to fix/enhance poorly saturated images or cartoonization."
url="http://code.google.com/p/cartooner-color-reducer/"
license="GPL3"
arch=('i686' 'x86_64')
depends=(gimp)
#makedepends=()
source=(http://selective-color-blur.googlecode.com/files/colorblur-${pkgver}.tgz)

build() {
	export LDFLAGS="$LDFLAGS -lm"
	
	cd ${srcdir}/colorblur
	
	gimptool-2.0 --build colorblur.c
	
	#copying file into pkgdir to be packed
	mkdir -p $pkgdir/usr/lib/gimp/2.0/plug-ins/
	
	install -m 755 colorblur $pkgdir/usr/lib/gimp/2.0/plug-ins/ 
	
}

sha1sums=('ed46aea519a05376514b22f743c71825ba09b7a4') 
