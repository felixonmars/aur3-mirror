# Maintainer: Patryk Kowalczyk <patryk AT kowalczyk ws>
pkgname=libiscsi
pkgver=1.7.0
pkgrel=1
pkgdesc="stable iscsi client library and utilities "
arch=('i686' 'x86_64')
url="https://github.com/sahlberg/libiscsi"
license=('GPL' 'LGPL') 
depends=()
makedepends=()
optdepends=()
conflicts=()
replaces=()
install='libiscsi.install'
source=("https://github.com/downloads/sahlberg/libiscsi/libiscsi-${pkgver}.tar.gz")
md5sums=('4ba621f47d016d48ab93d5301ae5a363')

build() {
    cd "$srcdir/libiscsi-${pkgver}"
	
	./autogen.sh
	./configure --prefix=/usr --libdir=/usr/lib
	make
}

package() {
    	cd "$srcdir/libiscsi-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
	
