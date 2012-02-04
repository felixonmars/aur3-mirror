# Maintainer: Facundo Bianco (vando) <facundo{at}esdebian{dot}org>
pkgname=mcabber-modules
pkgver=40
pkgrel=1
pkgdesc="All modules from MCabber repository"
arch=('i686' 'x86_64')
url="http://wiki.mcabber.com/index.php/Modules"
license=('GPL')
depends=('mcabber-hg')
optdepends=('screen: for extsay module')
makedepends=('pkgconfig' 'mercurial')
provides=("mcabber-modules")

_hgroot="http://hg.lilotux.net/index.cgi"
_hgrepo="mcabber-modules"

build() {
	cd $srcdir/mcabber-modules
	./autogen.sh
	./configure --enable-all-modules --prefix=/usr
	make || return 1
	
	for e in clock comment info_msgcount killpresence lastmsg; do
		install -Dm755 $e/.libs/lib$e.so  $pkgdir/usr/lib/mcabber/lib$e.so
		install -Dm755 $e/.libs/lib$e.lai $pkgdir/usr/lib/mcabber/lib$e.la
	done
	install -Dm755 extsay-ng/.libs/libextsay.so  $pkgdir/usr/lib/mcabber/libextsay.so
	install -Dm755 extsay-ng/.libs/libextsay.lai $pkgdir/usr/lib/mcabber/libextsay.la
	install -Dm644 extsay-ng/README    $pkgdir/usr/share/mcabber/doc/HOWTO_extsay.txt
	install -Dm755 extsay-ng/extsay.sh $pkgdir/usr/share/mcabber/example/extsay.sh
}
