# Maintainer: Simone Baratta < Conte91 (at) gmail (dot) com >

pkgname=3dchess
pkgver=0.8.1
pkgrel=1
pkgdesc="An opensource 3d Chess game for X11. 96 pieces, 26 possible directions."
arch=('i686' 'x86_64')
url=http://ibiblio.org/pub/linux/games/strategy
license=('GPL')
depends=('xaw3d')
makedepends=('gcc')
source=($url/3Dc-$pkgver.tar.gz)
md5sums=('9f577656749a4b67d8ff6b5283fdfe5f')
build() {
	cd $srcdir/3Dc/src
	#msg "Editing Makefile.."
	#Put here all the edit to makefiles you may want to do.
	msg "Launching make.."
	make 1>/dev/null
	msg "Installing package files.."
	make install 1>/dev/null
	mkdir -p $pkgdir/usr/bin
	cd ..
	cp 3Dc $pkgdir/usr/bin/3dchess
	msg "Make completed. Executable file position: /usr/bin/3dchess"
	return 0
}
