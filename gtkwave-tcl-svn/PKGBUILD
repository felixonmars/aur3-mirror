# Maintainer: Alex Forencich <alex@alexforencich.com>
# Maintainer: Rémi Audebert <contact@halfr.net>
pkgname=gtkwave-tcl-svn
pkgver=r1094
pkgrel=1
pkgdesc="A wave viewer which reads LXT, LXT2, VZT, GHW and VCD/EVCD files (with TCL enabled)"
arch=('i686' 'x86_64')
url='http://gtkwave.sourceforge.net'
license=('GPL' 'MIT')
depends=('bzip2' 'xz' 'gtk2' 'tcl')
makedepends=('gperf' 'svn')
install='gtkwave.install'
provides=('gtkwave')

source=("$pkgname::svn://svn.code.sf.net/p/gtkwave/code/")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
	cd "$srcdir/$pkgname/gtkwave3"

	./configure \
		--prefix=/usr \
		--disable-mime-update

	make CFLAGS=-D_LARGEFILE64_SOURCE
}

package() {
	cd "$srcdir/$pkgname/gtkwave3"

	make DESTDIR="${pkgdir}" install

	install -D -m644 "$srcdir/$pkgname/gtkwave3/LICENSE.TXT" \
		"$pkgdir/usr/share/licenses/gtkwave/LICENSE.TXT"
}

