# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sane-gt68xx-ps1fw
pkgver=1
pkgrel=1
pkgdesc="Firmware for the Mustek BearPaw 1200 CU plus scanner and clones"
arch=('any')
url="http://www.meier-geinitz.de/sane/gt68xx-backend"
license=('custom')
depends=('sane')
source=("http://www.meier-geinitz.de/sane/gt68xx-backend/firmware/PS1fw.usb")
sha512sums=('a7a3c6aa83a0be74b7ed102545d0708ffdb9a7e25026c0f17b2b270d113d56261f951610052ea0cd0db69c0db453250eafa1bd333edaee3997c66e32bc69bd1a')

package() {
  install -Dm644 "$srcdir/PS1fw.usb" "$pkgdir/usr/share/sane/gt68xx/PS1fw.usb"
}
