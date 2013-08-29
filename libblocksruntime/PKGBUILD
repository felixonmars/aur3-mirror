# Maintainer: SJ_UnderWater

pkgname=libblocksruntime
pkgver=0.3
pkgrel=0
pkgdesc='Development headers for building software that uses blocks'
url='http://mark.heily.com/project/libblocksruntime'
arch=('i686' 'x86_64')
depends=(glibc)
makedepends=(ruby clang)
license=('APACHE')
options=('!libtool')
source=(http://iweb.dl.sourceforge.net/project/${pkgname#lib}/libBlocksRuntime-$pkgver.tar.gz)
md5sums=('9731dac1aff89a65ba0cb83ad5da9cda')

build() {
	cd libBlocksRuntime-$pkgver
	msg2 "Configuring..."
	CFLAGS="-fPIC" ./configure --prefix=/usr
	msg2 "Making..."
	make
}
package() {
	cd libBlocksRuntime-$pkgver
	msg2 "Building..."
	make DESTDIR="$pkgdir" install
}
