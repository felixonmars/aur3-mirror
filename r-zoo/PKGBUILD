# Maintainer:  Matt Monaco <net 0x01b matt>

_rpkg=zoo
pkgname=r-${_rpkg}
pkgver=1.7_7
pkgrel=1
pkgdesc="S3 Infrastructure for Regular and Irregular Time Series (Z's ordered observations)"
arch=('i686' 'x86_64')
url="http://www.math.csi.cuny.edu/UsingR"
license=("GPL2")
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_rpkg}_${pkgver/_/-}.tar.gz")
md5sums=('086cb298c6a84daf87b74bb388a3f89a')

package() {

	cd "$srcdir"
	mkdir -p "$pkgdir/usr/lib/R/library/"
	R CMD INSTALL -l "$pkgdir/usr/lib/R/library/" $_rpkg
}

# vim: set noet :
