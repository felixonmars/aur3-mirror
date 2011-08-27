# Maintainer: Tetsumaki <http://goo.gl/YMBdA>
# Contributor: Dennis Kempin <mail@dennis-kempin.de>

pkgname=ppu-binutils-old
pkgver=2.17.50_32
pkgrel=1
pkgdesc="GNU toolchain for cross-compiling to Cell Broadband Engine's PPU"
arch=('i686')
url="http://www.bsc.es/plantillaH.php?cat_id=461"
license=('GPL')
depends=()
makedepends=('rpmextract')
groups=(cbea-sdk)
source=(http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.0/CellSDK-Open-Fedora/x86/ppu-binutils-2.17.50-32.i686.rpm)
sha256sums=('b033f96f5eb2ca90735ee1da4d122e412a6824e11831333ffb2c103beb0feb6a')

build() {
  cd $startdir/pkg
  for src in $startdir/src/*.rpm; do rpmextract.sh $src || return 1; done
}
