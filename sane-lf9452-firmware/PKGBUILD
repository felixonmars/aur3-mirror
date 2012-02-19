# Contributor: maribu (mari.hahn (at) uni-muenster.de)

pkgname=sane-lf9452-firmware
pkgver=0.7.3
pkgrel=1
pkgdesc="SANE firmware for Lifetec LT 9452 scanner"
url="http://www.meier-geinitz.de/sane/gt68xx-backend/"
depends=()
license=()
arch=(i686 x86_64)
source=(http://www.meier-geinitz.de/sane/gt68xx-backend/firmware/sbfw.usb)

build(){
  mkdir -p $pkgdir/usr/share/sane/gt68xx
  cp $srcdir/sbfw.usb $pkgdir/usr/share/sane/gt68xx/PS1fw.usb
}

md5sums=('4c3928214b03588a1e67c75f06d14dbb')
