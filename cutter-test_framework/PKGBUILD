pkgname=cutter-test_framework
pkgver=1.2.4
pkgrel=1
pkgdesc="cutter is c/c++ unit test framework."
arch=('i686' 'x86_64')
url="http://cutter.sourceforge.net/index.html"
license=('FDL1.3' 'LGPL3')
source=("http://downloads.sourceforge.net/project/cutter/cutter/$pkgver/cutter-$pkgver.tar.gz")
depends=('glib2' 'intltool' 'perl' 'pkg-config' 'libsoup' 'gettext')
optdepends=('gtk2' 'cairo' 'pango' 'ruby')

build() {

	cd $srcdir/cutter-$pkgver
	 ./configure --prefix=/usr \
	 --enable-static=no \
	 --with-html-dir=/usr/share/doc
	
	 make 
}

package() {
	cd $srcdir/cutter-$pkgver
	make DESTDIR="$pkgdir" install
}

md5sums=('26e45c17da619f5e4ce832bc612e85ef')
