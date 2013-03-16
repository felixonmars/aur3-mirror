# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=kyocera-fs-11001300
pkgver=8.4
pkgrel=1
pkgdesc="CUPS driver for Kyocera FS-1100 and FS-1300"
arch=('any')
url="http://www.kyoceradocumentsolutions.eu/index/service/dlc.false.driver.FS1300D._.EN.html"
license=('nonfree')
depends=('cups')
makedepends=('unzip')
install='driver.install'
source=('http://example.com')
sha512sums=('1503ba2c184788732fb0c418815e8837ef0c616dcc787141a93120d17e20e12690d49f3ebe484b7c10e06dd9d5010180415cea4d6ce4b67b44e7de42133a6b92')

build() {
  cd "$srcdir/"
  wget "http://cdn.kyostatics.net/dlc/eu/driver/all/linux_ppds_fs11001300.-downloadcenteritem-Single-File.downloadcenteritem.tmp/Linux_PPDs_FS11001300.zip"
  unzip Linux_PPDs_FS11001300.zip
}

package() {
  cd "$srcdir/"
  install -D "Linux/English/Kyocera FS-1100.PPD" "${pkgdir}/usr/share/cups/model/Kyocera/Kyocera FS-1100.PPD"
  install -D "Linux/English/Kyocera FS-1300D.PPD" "${pkgdir}/usr/share/cups/model/Kyocera/Kyocera FS-1300D.PPD"
}

# vim:set ts=2 sw=2 et:
