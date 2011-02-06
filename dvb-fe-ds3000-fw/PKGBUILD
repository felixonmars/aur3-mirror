# Maintainer: mastero23 <mastero23 at gmail dot com>

pkgname=dvb-fe-ds3000-fw
pkgver=0.1
pkgrel=2
pkgdesc="Firmware for Geniatech DVB-S2 HDStar"
arch=('any')
url="http://www.geniatech.com/"
license=('unknown')
source=(http://www.geniatech.com/down-eng/dvbs/hdstarlinuxdriver.zip)
md5sums=('55a1d11b542c070cce6852045a21cbf3')

package() {
  install -D -m 664 "$srcdir/Su3000LinuxDrv/dvb-fe-ds3000.fw" "$pkgdir/lib/firmware/dvb-fe-ds3000.fw"
}
