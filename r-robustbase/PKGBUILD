# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-robustbase
pkgver=0.7_3
pkgrel=1
pkgdesc="Robust Statistics for the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/robustbase/index.html"
license=("GPL2")
depends=('r')
source=(http://cran.r-project.org/src/contrib/robustbase_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./robustbase
}
md5sums=('f87f83142b36581d305baec92c6d3e75')
