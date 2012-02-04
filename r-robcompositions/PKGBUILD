# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-robcompositions
pkgver=1.5.0
pkgrel=1
pkgdesc="Methods for imputation of compositional data including robust methods, for R."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/robCompositions/index.html"
license=("GPL2")
depends=('r' 'r-car' 'r-robustbase' 'r-rrcov')
source=(http://cran.r-project.org/src/contrib/robCompositions_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./robCompositions
}
md5sums=('952eb95e05f2cf4983118f7c41ae33f3')
