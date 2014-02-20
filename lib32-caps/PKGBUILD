# Maintainer: Shill Shocked <shillshocked@gmail.com>
# Maintainer: Lara Maia <lara@craft.net.br>
# Contributor: DonVla <donvla@users.sourceforge.net>
#              Reza Jelveh <reza.jelveh at tuhh.de>

pkgname=lib32-caps
pkgver=0.9.20
pkgrel=2
pkgdesc="The C* Audio Plugin Suite (32 bit)"
arch=('x86_64')
url="http://quitte.de/dsp/caps.html"
license=('GPL')
options=(docs emptydirs)
depends=('lib32-gcc-libs')
makedepends=('python')
source=("http://quitte.de/dsp/${pkgname##*-}_$pkgver.tar.bz2")
md5sums=('0bb3935f6747a7087ca32a67bd0d8793')

prepare() {
	cd "$srcdir/${pkgname##*-}-$pkgver"
	
	sed -i 's|/usr/local|/usr|' Makefile
	sed -i 's|CC = g++|CC = g++ -m32|' Makefile
	sed -i 's|-shared|-shared -L/usr/lib32|' Makefile
	sed -i 's|/lib/|/lib32/|' Makefile
	
	sed -i 's| 	install -d $(RDFDEST)||' Makefile
	sed -i 's|	install -m 644 $(PLUG).rdf $(RDFDEST)||' Makefile
	
	make clean
}

build() {
	cd "$srcdir/${pkgname##*-}-$pkgver"
	
	./configure.py
	make
}
 
package() {
	cd "$srcdir/${pkgname##*-}-$pkgver"
	
	install -v -m 0755 -D caps.so "${pkgdir}/usr/lib32/ladspa/caps.so"
	install -v -m 0644 -D caps.rdf "${pkgdir}/usr/share/ladspa/rdf/lib32-caps.rdf"
}
