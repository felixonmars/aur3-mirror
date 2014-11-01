# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: paterbrown <paterbrown at silberhelme dot de>

pkgname=buddi
_pkgname=Buddi
pkgver=3.4.1.12
pkgrel=1
pkgdesc="personal finance and budgeting program, aimed at those who have little or no financial background"
arch=('i686' 'x86_64')
url="http://buddi.digitalcave.ca/"
license=('GPL2')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/buddi/$_pkgname-$pkgver.tgz
	$pkgname.png
	$pkgname.desktop
	$pkgname.sh)
md5sums=('887b1ab82117a04a4d17aa08a1e59b3c'
         '8b43f3eb90181edd4bc51dfe9c0cae0b'
         '91965f88264f643f0110fac1dbe173b3'
         '5060ee1aac598593ca45c4336924f83a')


package() {
	cd $srcdir/$_pkgname
	install -D -m644 ./Buddi.jar $pkgdir/usr/share/java/buddi/Buddi.jar
	install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
	install -D -m644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
