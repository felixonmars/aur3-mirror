# Contributor: Dennis Kempin <mail@dennis-kempin.de>
pkgname=spu-gcc
pkgver=4.1.1_107.5
pkgrel=1
pkgdesc="GNU toolchain for cross-compiling to Cell Broadband Engine's SPU"
arch=('i686')
url="http://www.bsc.es/plantillaH.php?cat_id=461"
license=('GPL')
depends=(spu-binutils)
makedepends=('rpmextract')
groups=(cbea-sdk)
options=(!strip)
source=(
	http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.0.0.3/CellSDK-Open-Updates-RHEL/x86/spu-gcc-4.1.1-107.5.i686.rpm
	http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.0.0.3/CellSDK-Open-Updates-RHEL/x86/spu-gcc-c++-4.1.1-107.5.i686.rpm	
	http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.0.0.3/CellSDK-Open-Updates-RHEL/x86/spu-gcc-fortran-4.1.1-107.5.i686.rpm
)
md5sums=('18f0de3ad9ae820fb8e3a397bdb52039'
         '25d0ce96ca9178dee62926025716afd3'
         'b190b08c137c1bbedebe08a1cd3826e2')

build() {
	cd $startdir/pkg
	for src in $startdir/src/*.rpm; do rpmextract.sh $src || return 1; done
}
