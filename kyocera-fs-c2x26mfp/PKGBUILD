# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=kyocera-fs-c2x26mfp
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="CUPS driver for Kyocera FS-C2026MFP and FS-C2126MFP"
arch=('any')
url="http://www.kyoceradocumentsolutions.com/download/"
license=('MIT')
groups=()
depends=('cups')
makedepends=('coreutils')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='driver.install'
changelog=
source=('Linux_PPDs_FS-C2026_2126.zip')
noextract=()
md5sums=('3e71751f951116e4c10ccfc01fb60752')

package() {
  cd "$srcdir/"

  install -D English/Kyocera_FS-C2026MFP.ppd $pkgdir/usr/share/cups/model/Kyocera/Kyocera_FS-C2026MFP.ppd
  install -D English/Kyocera_FS-C2126MFP.ppd $pkgdir/usr/share/cups/model/Kyocera/Kyocera_FS-C2126MFP.ppd
}

# vim:set ts=2 sw=2 et:
