# Contributor: Sebastien Piccand <sebcactus gmail com>
# Contributor: tolgam
pkgname=openbeagle
pkgver=3.0.3
pkgrel=4
pkgdesc="Open BEAGLE is a C++ Evolutionary Computation (EC) framework"
arch=('i686' 'x86_64')
url="http://beagle.gel.ulaval.ca/"
license=('LGPL')
options=('!libtool') 
source=(http://downloads.sourceforge.net/sourceforge/beagle/beagle-$pkgver.tar.gz $pkgname.pc ${pkgname}-build.patch)
md5sums=('de928be9857e522e9180f5f6a190377e' '453197b2af5a994b919988c628cbd229'
	 'bdcac488734b8e1c580dbb2aef9d14d1')

build() {
	cd "$srcdir"/beagle-$pkgver
	patch -p1 < ../${pkgname}-build.patch
	./configure --prefix=/usr --enable-optimization
	make
}
package() {
   cd "$srcdir"/beagle-$pkgver
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir"/usr/lib/pkgconfig/
	cp "$srcdir"/$pkgname.pc "$pkgdir"/usr/lib/pkgconfig/$pkgname.pc

}
