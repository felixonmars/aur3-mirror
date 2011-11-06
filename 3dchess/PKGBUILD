# Maintainer: Simone Baratta < Conte91 (at) gmail (dot) com >
# Contributor: <linas_fi@ymail.com>

pkgname=3dchess
pkgver=0.8.1
pkgrel=2
debianrel=17
pkgdesc="An opensource 3d Chess game for X11. 96 pieces, 26 possible directions."
arch=('i686' 'x86_64')
url=http://ibiblio.org/pub/linux/games/strategy
license=('GPL')
depends=('xaw3d')
makedepends=('gcc')
source=($url/3Dc-$pkgver.tar.gz http://ftp.debian.org/debian/pool/main/3/3dchess/3dchess_$pkgver-$debianrel.debian.tar.gz)
md5sums=(9f577656749a4b67d8ff6b5283fdfe5f 411cb216b6bf09603d24ab4c40c5a0ff)
sha1sums=(541dacafd84fffae65d3acd76b8e256d652db66f 1fea63891e6e45ee3bb076c57aaf5bfd59db7b1b)
build() {
	cd $srcdir/3Dc
	msg "Patching rules' files..."
	patch < $srcdir/debian/patches/12_3Dc-rules.html.patch
	cd src
	msg "Launching make.."
	make
}

package() {
	cd $srcdir/3Dc/src
	mkdir -p $pkgdir/usr/bin
	make install BINDIR=$pkgdir/usr/bin
	ln -s 3Dc $pkgdir/usr/bin/3dchess
	# Install man page
	install -D -m644 $srcdir/debian/3Dc.6 $pkgdir/usr/share/man/man6/3Dc.6
	install -D -m644 $srcdir/3Dc/3Dc-rules.html $pkgdir/usr/share/doc/3dchess/3dc-rules.html
	msg "Install completed."
	return 0
}

