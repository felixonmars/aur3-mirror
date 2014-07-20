# Maintainer: David Barchiesi <david@barchie.si>
pkgname=vortex
pkgver=1.1.13.b5215.g5215
pkgrel=1
pkgdesc="Vortex Library is an implementation of the BEEP Core protocol using the C language."
arch=('i686' 'x86_64')
url="http://www.aspl.es/vortex/"
license=('(L)GPL2')
makedepends=('doxygen')
depends=('axl')
CFLAGS="-Wno-error"

source=(https://vortexlibrary.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('9b7c0e5173c06f865f96411af42e98c7')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --disable-py-vortex

    # Disable building tests because of build failure
    sed -i 's/lua-vortex\ test\ xml-rpc-gen/lua-vortex\ xml-rpc-gen/g' ./Makefile
    sed -i 's/\$(VORTEX_TEST_DIR)//g' ./Makefile

	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
