pkgname=cobalt-panel-utils
pkgver=1.0.2
pkgrel=1
pkgdesc="Utilities which allow programming Sun Cobalt RAQ servers front-panel"
arch=(
	'i686'
)
url='http://gentoo.404ster.com/projects.php?action=view&id=1'
license=GPL
depends=()
source=(
	"ftp://gentoo.404ster.com/pub/gentoo-stuff/ebuilds/$pkgname-$pkgver.tar.gz"
)
md5sums=(
	'025862c2c8e779f2d1d0b08f553e35fe'
)

build() {
	mkdir -p $startdir/pkg/usr/bin
	cd $startdir/src/$pkgname-$pkgver/
	make
	install -m755 iflink			$startdir/pkg/usr/bin/iflink
	install -m755 iflinkstatus		$startdir/pkg/usr/bin/iflinkstatus
	install -m755 lcd-flash			$startdir/pkg/usr/bin/lcd-flash
	install -m755 lcd-setcursor		$startdir/pkg/usr/bin/lcd-setcursor
	install -m755 lcd-swrite		$startdir/pkg/usr/bin/lcd-swrite
	install -m755 lcd-write			$startdir/pkg/usr/bin/lcd-write
	install -m755 lcd-yesno			$startdir/pkg/usr/bin/lcd-yesno
	install -m755 readbutton		$startdir/pkg/usr/bin/readbutton
}
