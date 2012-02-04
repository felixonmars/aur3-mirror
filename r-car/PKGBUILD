# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-car
pkgver=2.0_10
pkgrel=1
pkgdesc="Companion to Applied Regression (J. Fox & S. Weisberg).  For the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/car/index.html"
license=("GPL2")
depends=('r')
source=(http://cran.r-project.org/src/contrib/car_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./car
}
md5sums=('0862f4fd82eaee57a438cbb1a5e065f6')
