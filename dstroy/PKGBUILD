# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=dstroy
pkgver=1.7
pkgrel=1
pkgdesc="Rewrite of an old bomberman-like"
arch=(i686 x86_64)
url="http://narroin.free.fr/dstroy/"
license=(custom)
depends=('sdl' 'sdl_mixer' 'sdl_net' 'sdl_image')
makedepends=('make' 'gcc')
source=('http://narroin.free.fr/dstroy/res/dstroySrc_20090214.zip'
	'http://narroin.free.fr/dstroy/res/dstroyWin32_20090206.zip')
md5sums=('31004c2af56f1aae807968dd3df87d07'
         '291d86e0e32b64d220352526dca0167f')

build() {
	cd "$srcdir/dstroy_src"
	rm -f dstroydata
	ln -s ../dstroy/dstroydata dstroydata
	make -f Makefile.linux PREFIX=/usr BINDIR=/usr/bin || return 1
}

package() {	
	cd "$srcdir/dstroy_src"
	make -f Makefile.linux PREFIX=/usr BINDIR=/usr/bin GROUP=root DESTDIR="$pkgdir" install || return 1

	# Fix permissions
	cd "$pkgdir"
	find usr -type f -exec chmod 644 {} \; &&
	find usr -type d -exec chmod 755 {} \; &&
	chmod 755 usr/bin/dstroy || return 1
}
