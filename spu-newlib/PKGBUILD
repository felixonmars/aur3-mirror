# Contributor: Dennis Kempin <mail@dennis-kempin.de>
pkgname=spu-newlib
pkgver=1.15.0_82.6
pkgrel=4
pkgdesc="Standard libraries and headers for cross-compiling to Cell Broadband Engine's SPU"
arch=('i686')
url="http://www.bsc.es/plantillaH.php?cat_id=461"
license=('GPL')
makedepends=('rpmextract')
replaces=(spu-newlib-cross)
source=(
http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.0.0.3/CellSDK-Open-Updates-RHEL/x86/spu-newlib-1.15.0-82.6.i686.rpm
)
md5sums=('8c9613e27d2d51ed4e81c54cc1ae13fa')

build() {
	cd $startdir/pkg
	for src in $startdir/src/*.rpm; do rpmextract.sh $src || return 1; done
}
