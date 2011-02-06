# Contributor: Dennis Kempin <mail@dennis-kempin.de>
pkgname=ppu-gcc
pkgver=4.1.1_57.3
pkgrel=1
pkgdesc="GNU toolchain for cross-compiling to Cell Broadband Engine's PPU"
arch=('i686')
url="http://www.bsc.es/plantillaH.php?cat_id=461"
license=('GPL')
depends=(ppu-sysroot ppu-binutils)
makedepends=('rpmextract')
groups=(cbea-sdk)
source=(
	http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.0.0.3/CellSDK-Open-Updates-RHEL/x86/ppu-gcc-4.1.1-57.3.i686.rpm
	http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.0.0.3/CellSDK-Open-Updates-RHEL/x86/ppu-gcc-c++-4.1.1-57.3.i686.rpm
	http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.0.0.3/CellSDK-Open-Updates-RHEL/x86/ppu-gcc-gnat-4.1.1-57.3.i686.rpm
	http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.0.0.3/CellSDK-Open-Updates-RHEL/x86/ppu-gcc-fortran-4.1.1-57.3.i686.rpm
)
md5sums=('99c5884d725c69612c62dbe920970c59'
         'dad37a75da526aeed4708e803136e05a'
         '4d8292ce1bd9ca6fddd0a216629f5c43'
         '0014101cdb720a15be1733db87b2f861')

build() {
	cd $startdir/pkg
	for src in $startdir/src/*.rpm; do rpmextract.sh $src || return 1; done
}
