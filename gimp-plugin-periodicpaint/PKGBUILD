# Contributor: Tibor Bamhor <tiborb95 at gmail.com>

pkgname=gimp-plugin-periodicpaint
pkgver=0.2.0
pkgrel=1
pkgdesc="Copies what you paint repeatedly. Intended for creation of seamless patterns or game tilesets."
url="http://code.google.com/p/cartooner-color-reducer/"
license="GPL3"
arch=('i686' 'x86_64')
depends=(gimp)
#makedepends=()
source=(http://repeated-painter-gimp-plugin.googlecode.com/files/periodicpaint-${pkgver}.tgz)

package() {
	
	cd ${srcdir}/periodicpaint
	
	gimptool-2.0 --build periodicpaint.c
	
	#copying file into pkgdir to be packed
	mkdir -p $pkgdir/usr/lib/gimp/2.0/plug-ins/
	
	install -m 755 periodicpaint $pkgdir/usr/lib/gimp/2.0/plug-ins/ 
	
}

sha1sums=('abc78e6d755ef1d451005766073de48c174d7a62') 
