# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=sane-gt68xx-a2fw
pkgver=1
pkgrel=1
pkgdesc="Firmware for the Mustek BearPaw 2400 TA scanner and clones"
arch=('any')
url="http://www.meier-geinitz.de/sane/gt68xx-backend"
license=('custom')
depends=('sane')
source=("http://www.meier-geinitz.de/sane/gt68xx-backend/firmware/A2fw.usb")
md5sums=('f2db0a9be640f5a7b2a91c4fcbc2873e')

package() {
  install -Dm644 "$srcdir/A2fw.usb" "$pkgdir/usr/share/sane/gt68xx/A2fw.usb"
}
