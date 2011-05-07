# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-ks
pkgver=1.8.1
pkgrel=1
pkgdesc="Kernel smoothers for univariate and multivariate data for the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/ks/index.html"
license=("GPL2")
depends=('r' 'r-mvtnorm' 'r-misc3d' 'r-rgl')
source=(http://cran.r-project.org/src/contrib/ks_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./ks
}
md5sums=('05b9d0afd85db6b74ba9b821fc1b8b9e')
