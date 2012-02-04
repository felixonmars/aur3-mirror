# Contributor: Dennis Kempin <mail@dennis-kempin.de>
pkgname=libspe2
pkgver=2.2.0_91
pkgrel=3
pkgdesc="SPE 2 Runtime cross development package"
arch=('i686')
url="http://www.bsc.es/plantillaH.php?cat_id=461"
license=('GPL')
makedepends=('rpmextract')
groups=(cbea-sdk)
source=(
	http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.0/CellSDK-Open-Fedora/x86/libspe2-cross-devel-2.2.0-91.noarch.rpm
)
md5sums=('21d20815ded361c93b20a84808c8f348')

build() {
	cd $startdir/pkg
	for src in $startdir/src/*.rpm; do rpmextract.sh $src || return 1; done
}
