# Maintainer: Malte Bublitz <yoda123@lavabit.com>
pkgname=tksol
pkgver=1.9.1
pkgrel=1
pkgdesc="A Tcl/Tk version of the standard card game solitaire"
arch=("any")
url="http://tkgames.sf.net"
license=('GPL')
depends=('tcl' 'tk')
source=("http://prdownloads.sourceforge.net/tkgames/$pkgname-$pkgver.tgz?download")
sha256sums=('cc9d9bb9b48f6d6bc0628a0b102de3ba92573e481b0e978cb5e16aa1ee80b719')

build() {
	cd $srcdir/$pkgname

	# Patch to expect files in /usr/lib/tksol, not /usr/local/lib/tksol
	sed -i 's@/usr/local@/usr@g' tksol
}

package() {
	cd $srcdir/$pkgname

	# copy program
	install -d $pkgdir/usr/bin
	install tksol $pkgdir/usr/bin
	# copy manual page
	install -d $pkgdir/usr/share/man/man6
	install tksol.6 $pkgdir/usr/share/man/man6
	# copy documentation
	install -d $pkgdir/usr/share/doc/tksol
	install -t $pkgdir/usr/share/doc/tksol install readme
	# copy all the rest
	install -d $pkgdir/usr/lib/tksol
	install -t $pkgdir/usr/lib/tksol mask.xbm place.xbm
	cp -r cardbacks cards pictures $pkgdir/usr/lib/tksol
}
