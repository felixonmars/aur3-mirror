# Maintainer: m0rph <m0rph[at]gmail[dot]com>

pkgname=libsockets
pkgver=2.3.9.9
pkgrel=1
pkgdesc="The C++ class library wrapping the berkeley sockets C API."
url="http://www.alhem.net/Sockets/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('openssl' 'libxml2')
source=("http://www.alhem.net/Sockets/Sockets-${pkgver}.tar.gz")
md5sums=('ad8cf9a5becffbd626c667456ee13e63')


build() {
	cd "${srcdir}/Sockets-${pkgver}"
	sed -i 's|^//#define ENABLE_POOL|#define ENABLE_POOL|' ./sockets-config.h 
	sed -i 's|^//#define ENABLE_SOCKS4|#define ENABLE_SOCKS4|' ./sockets-config.h 
	make
}


package() {
	cd "${srcdir}/Sockets-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX="/usr" install
	make DESTDIR="${pkgdir}" PREFIX="/usr" install_shared
	rm -rf "${pkgdir}/usr/bin"
}
