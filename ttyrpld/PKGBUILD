pkgname=ttyrpld
pkgver=2.60
pkgrel=2
pkgdesc="ttyrpld is a kernel-level TTY keylogger and screenlogger with (a)synchronous replay support"
url="http://ttyrpld.sourceforge.net/"
arch=('i686' 'x86_64')
license=("GPL2")
makedepends=('libhx')
source=('http://downloads.sourceforge.net/project/ttyrpld/ttyrpld/2.60/ttyrpld-2.60.tar.bz2')
sha512sums=("c86b70a82ab40ab324d394eb60ed1377ab273d3e33c0bcd558c62d4d528c385f1d048306fa6370b0bae73ff2318c65cec3c8912911ad022d6e9aa56746e4e833")

build () {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure
	make
}
package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
