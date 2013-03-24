# Maintainer: DonVla <donvla@users.sourceforge.net>

pkgname=kyocera-fs1370dn
pkgver=8.4
pkgrel=1
pkgdesc="CUPS driver for Kyocera FS-1370DN"
arch=('any')
url="http://www.kyoceradocumentsolutions.eu/index/service/dlc.false.driver.FS1370DN._.EN.html"
license=('MIT')
depends=('cups')
makedepends=('wget')
install=driver.install
md5sums=()
sha256sums=()

build() {
  cd "$srcdir/"
  wget "http://cdn.kyostatics.net/dlc/eu/driver/all/fs-1370d_linux_zip.-downloadcenteritem-Single-File.downloadcenteritem.tmp/FS-1370D_Linux.zip"
  bsdtar -xf "FS-1370D_Linux.zip"
}

package() {
  cd "$srcdir/Linux"
  install -d "${pkgdir}/usr/share/cups/model/Kyocera"
  cp -av English French Italian German Portuguese Spanish "${pkgdir}/usr/share/cups/model/Kyocera"
}

# vim:set ts=2 sw=2 et:
