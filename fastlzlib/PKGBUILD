# Maintainer: Max Meyer <dev |aet| fedux |dut| org>
pkgname=fastlzlib
pkgver=0.1
pkgrel=2
pkgdesc="zlib-like interface to fast block compression (LZ4 or FastLZ) libraries"
arch=(i686 x86_64)
url="https://github.com/bareos/${pkgname}"
license=('BSD' 'MIT')
depends=( 'glibc' )
makedepends=( 'make' 'gcc' 'zlib' 'automake' )
source=(https://github.com/bareos/fastlzlib/archive/master.zip)
install=${pkgname}.install
sha256sums=('fb7d521bf6b5a3216ff0c47b0c4524a3c6e8983c4d73f10d27ef1320b0eac6af')

build() {
	cd "$srcdir/${pkgname}-master"
  ./configure --prefix /usr --disable-static --libdir '/usr/lib' --bindir '/usr/bin' --sbindir '/usr/bin'
  make
}

package() {
	cd "$srcdir/${pkgname}-master"
	make DESTDIR="$pkgdir/" install

  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
