# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-feature
pkgver=1.2.7
pkgrel=1
pkgdesc="Feature significance for multivariate kernel density estimation for the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/feature/index.html"
license=("GPL2")
depends=('r' 'r-ks')
source=(http://cran.r-project.org/src/contrib/feature_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./feature
}
md5sums=('8d2b4a338b11d83caf3ed22e38658e16')
