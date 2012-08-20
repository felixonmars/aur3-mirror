# Maintainer: Andrea Repetto <darkraziel at libero dot it>
# Contributor: Ivan Gasperoni <gaspe (at) libero (dot) it>
_realpkg=freepops
pkgname=$_realpkg-bin
pkgver=0.2.9
pkgrel=2
pkgdesc="A program to convert webmail interfaces to pop3"
arch=('i686' 'x86_64')
url="http://freepops.sourceforge.net/"
license=('GPL')
depends=('curl' 'expat')
provides=('freepops')
conflicts=('freepops')
source=(http://repository.slacky.eu/slackware64-13.1/network/freepops/$pkgver/$_realpkg-$pkgver-$CARCH-3sl.txz
	freepopsd)
install=freepops.install
md5sums=('b21b5a841463b42ef01269c31883091f'
         '5c83ddaeababceba6435aad47e92c48e')

build() {
	cd $srcdir
	cp -R $srcdir/usr $pkgdir/usr
	install -D -m755 $srcdir/freepopsd $pkgdir/etc/rc.d/freepopsd
	
	cd $pkgdir
	mv $pkgdir/usr/man $pkgdir/usr/share/man
	mv $pkgdir/usr/doc $pkgdir/usr/share/doc
}
