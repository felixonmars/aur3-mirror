# Contributor: Dennis Kempin <mail@dennis-kempin.de>
pkgname=spu-binutils
pkgver=2.17.50_33
pkgrel=1
pkgdesc="GNU toolchain for cross-compiling to Cell Broadband Engine's SPU"
arch=('i686')
url="http://www.bsc.es/plantillaH.php?cat_id=461"
license=('GPL')
depends=()
makedepends=('rpmextract')
groups=(cbea-sdk)
options=(!strip)
source=(
	http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.0/CellSDK-Open-Fedora/x86/spu-binutils-2.17.50-33.i686.rpm
)
md5sums=('39df603717a57f85a39c0523551dd17a')

build() {
	cd $startdir/pkg
	for src in $startdir/src/*.rpm; do rpmextract.sh $src || return 1; done
}
