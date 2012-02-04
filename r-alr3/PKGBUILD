# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-alr3
pkgver=2.0.3
pkgrel=1
pkgdesc="Library accompanying S. Weisberg (2005), 'Applied Linear Regression,' 3rd edition, Wiley.  For the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/alr3/index.html"
license=("GPL2")
depends=('r' 'r-car')
source=(http://cran.r-project.org/src/contrib/alr3_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./alr3
}

md5sums=('80386f38d3b9379229c0cb6deb81e72f')
