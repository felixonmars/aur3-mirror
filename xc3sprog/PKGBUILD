pkgname=xc3sprog
pkgver=758
pkgrel=1
pkgdesc="suite of utilities for programming Xilinx FPGAs, CPLDs, and EEPROMs with the Xilinx Parallel Cable and other JTAG adapters"
arch=(i686 x86_64)
url="http://xc3sprog.sourceforge.net/"
license=('GPL')
depends=('libftdi-compat' 'gcc-libs' 'libusb-compat')
makedepends=('subversion' 'cmake')
source=("$pkgname.svn::svn://svn.code.sf.net/p/xc3sprog/code/trunk")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname.svn"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname.svn"
	make DESTDIR="$pkgdir/" install
	install -Dm0644 xc3sprog.1 $pkgdir/usr/share/man/man1/xc3sprog.1
}
