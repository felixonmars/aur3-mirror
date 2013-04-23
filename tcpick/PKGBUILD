# Maintainer: Brad Conte <brad AT bradconte.com>
pkgname=tcpick
pkgver=0.2.1
pkgrel=5
pkgdesc="TCP stream sniffer and connection tracker"
arch=('i686' 'x86_64')
depends=('libpcap')
source=(http://download.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('bb94f2f9ea81aeb645619fbe9b3b9a29')
url="http://tcpick.sourceforge.net"
install=
license=('GPL')

build() {
	cd $startdir/src/$pkgname-$pkgver

	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd $startdir/src/$pkgname-$pkgver

	make DESTDIR=$pkgdir install
}
