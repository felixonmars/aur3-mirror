# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-rrcov
pkgver=1.2_01
pkgrel=1
pkgdesc="Scalable Robust Estimators with High Breakdown Point for the R language"
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/rrcov/index.html"
license=("GPL2")
depends=('r' 'r-mvtnorm' 'r-pcapp' 'r-robustbase')
source=(http://cran.r-project.org/src/contrib/rrcov_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./rrcov
}

md5sums=('f9c00e7bf8fc223655e7adaa0cb2edf9')
