# Contributor: Changaco <changaco ατ changaco δοτ net>

pkgname=gag
pkgver=4.10
pkgrel=2
pkgdesc="A Graphical Boot Loader"
arch=(i686)
url="http://gag.sourceforge.net/"
license=('GPL')
source=('http://downloads.sourceforge.net/gag/gag4_10.zip')
md5sums=('387929c2fab5132e9b4e900132386e24')
install=INSTALL

package() {
	cd $srcdir/gag4.10/linux/
	mkdir -p $pkgdir/boot/gag $pkgdir/sbin
	cp *.COM $pkgdir/boot/gag
	install -m 755 gag-install $pkgdir/sbin/
}
