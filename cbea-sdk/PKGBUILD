# Contributor: Dennis Kempin <mail@dennis-kempin.de>
pkgname=cbea-sdk
pkgver=3.0.0.3
pkgrel=1
pkgdesc="Toolchain and libraries for cross-compiling to the Cell Broadband Engine"
arch=('i686')
url="http://www.bsc.es/plantillaH.php?cat_id=461"
license=('GPL')
depends=(ppu-sysroot ppu-gcc spu-gcc spu-newlib libspe2 numactl)
makedepends=('rpmextract')
source=(sdk_ver)
md5sums=()

build() {
	mkdir -p $startdir/pkg/opt/cell
	cp $startdir/src/sdk_ver $startdir/pkg/opt/cell/version || return 1
}
