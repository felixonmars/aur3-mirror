# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-mvoutlier
pkgver=1.8
pkgrel=1
pkgdesc="Multivariate outlier detection for the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/mvoutlier/index.html"
license=("GPL3")
depends=('r' 'r-compositions' 'r-robcompositions' 'r-robustbase')
source=(http://cran.r-project.org/src/contrib/mvoutlier_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./mvoutlier
}
md5sums=('6ffc9538abdd2b7c89a420a89197b7e9')
