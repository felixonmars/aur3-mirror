# Maintainer: Christian Hesse <mail@eworm.de>

_pkgbasename=libpng
pkgname=lib32-libpng16
pkgver=1.6.8
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics files (32 bit, 1.6 branch)"
arch=('x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('lib32-zlib')
makedepends=('gcc-multilib')
conflicts=('lib32-libpng<1.7')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-${pkgver}.tar.xz"
	"http://downloads.sourceforge.net/sourceforge/libpng/libpng-${pkgver}.tar.xz.asc")

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd libpng-${pkgver}

	./configure --prefix=/usr --libdir=/usr/lib32
	make
}

package() {
	cd libpng-${pkgver}

	make DESTDIR="${pkgdir}" install

	rm -rf "${pkgdir}/usr/"{bin,include,share}
	rm -rf "${pkgdir}/usr/lib32/"{libpng.so,libpng.a}
	rm -fr "${pkgdir}/usr/lib32/pkgconfig/libpng.pc"
}

sha256sums=('24f73d8b5e1d74a9482c81b65c3f93f96c7da7ed0417b8a948a75d2d99133081'
            'SKIP')
