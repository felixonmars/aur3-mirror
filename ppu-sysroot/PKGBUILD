# Contributor: Dennis Kempin <mail@dennis-kempin.de>
pkgname=ppu-sysroot
pkgver=f7_2
pkgrel=4
pkgdesc="Basic libraries and headers for cross-compiling to Cell Broadband Engine's PPU"
arch=('i686')
url="http://www.bsc.es/plantillaH.php?cat_id=461"
license=('GPL')
makedepends=('rpmextract')
groups=(cbea-sdk)
_sourceloc='http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.0/CellSDK-Open-Fedora/x86'
source=(
	$_sourceloc/${pkgname}-f7-2.noarch.rpm
	$_sourceloc/${pkgname}64-f7-2.noarch.rpm
)
md5sums=('007dd8660cbccbc8599a58c72d6833b8'
         '237d3b251108c42743154e9b3dbe8ef2')

build() {
	cd $startdir/pkg
	for src in $startdir/src/*.rpm; do rpmextract.sh $src || return 1; done
}
