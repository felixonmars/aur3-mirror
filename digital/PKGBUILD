#Maintainer: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=digital
pkgver=1.1
pkgrel=2
pkgdesc='A computer mystery/romance set five minutes into the future of 1988.'
arch=('i686' 'x86_64')
url=('http://www.scoutshonour.com/digital/')
license=('CC-BY-NC-SA')
source=(http://www.scoutshonour.com/lilyofthevalley/$pkgname-$pkgver.tar.bz2
		digitalgame
		digital.desktop)
md5sums=('574e5c069626f4850ac4acd06c280951'
         '9cd6fd87c5995ce9a85782712c77af09'
         '0795df6176584b0ebde8ad5c3688148c')

package() {
	cd $srcdir/Digital-linux-x86
 
 	install -dm755 $pkgdir/usr/share/digital-game
 	cp -R * $pkgdir/usr/share/digital-game
	install -Dm755 $srcdir/digitalgame $pkgdir/usr/bin/digitalgame
	install -Dm755 $srcdir/digital.desktop $pkgdir/usr/share/applications/digital.desktop
}
