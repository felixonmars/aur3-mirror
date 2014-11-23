# Maintainer: Félix Faisant <xcodexif@xif.fr>

pkgname=nopoll
pkgver=0.2.7.b164
pkgrel=1
pkgdesc="Websocket library written in C"
arch=('i686' 'x86_64')
url="http://www.aspl.es/nopoll/"
license=('LGPL')
groups=()
depends=('openssl')
makedepends=()
install=
source=("http://www.aspl.es/nopoll/downloads/nopoll-${pkgver}.tar.gz")
md5sums=('ef2bb0dceb0ff473e53f867abf2d58f4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --enable-maintainer-mode
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}