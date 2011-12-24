# Maintainer: recharge330 <recharge330 at gmail dot com>
pkgname=ttf-oblivion
pkgver=1.1
pkgrel=1
pkgdesc="Daedric fonts by dongle from the Elder Scrolls games"
arch=('any')
url="http://www.uesp.net"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-oblivion.install
source=('Obliviontt.zip')
md5sums=('217abc30ee43e2c2c3592c38dc86d27b')

build()
{
	install -Dm644 $srcdir/Oblivion/Oblivion.ttf $pkgdir/usr/share/fonts/TTF/Oblivion.ttf
	install -Dm644 $srcdir/Oblivion/Oblivion\ Worn.ttf $pkgdir/usr/share/fonts/TTF/OblivionWorn.ttf
}	
