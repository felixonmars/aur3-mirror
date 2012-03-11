# Maintainer:  Matt Monaco <net 0x01b matt>

_rpkg=UsingR
pkgname=r-usingr
pkgver=0.1_17
pkgrel=1
pkgdesc='A collection of datasets to accompany the textbook "Using R for Introductory Statistics."'
arch=('any')
url="http://www.math.csi.cuny.edu/UsingR"
license=("GPL")
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_rpkg}_${pkgver/_/-}.tar.gz")
md5sums=('86f0fdda2815218ea375d258a5c9e6c7')

package() {

	cd "$srcdir"
	mkdir -p "$pkgdir/usr/lib/R/library/"
	R CMD INSTALL -l "$pkgdir/usr/lib/R/library/" $_rpkg
}

# vim: set noet :
