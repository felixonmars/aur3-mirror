# Contributor: Dennis Kempin <mail@dennis-kempin.de>
pkgname=spu-newlib-cross
_pkgver=1.15.0-82
pkgver=1.15.0_82
pkgrel=3
pkgdesc="Standard libraries and headers for cross-compiling to Cell Broadband Engine's SPU"
arch=('i686')
url="http://www.bsc.es/plantillaH.php?cat_id=461"
license=('GPL')
makedepends=('rpmextract')
replaces=()
_sourceloc='http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.0/CellSDK-Open-Fedora/x86'
source=(
	$_sourceloc/spu-newlib-$_pkgver.$arch.rpm
)
md5sums=('86dd0c5ae025efd25072e1cb1c2db59d')

build() {
	cd $startdir/pkg
	for src in $startdir/src/*.rpm; do rpmextract.sh $src; done
}
