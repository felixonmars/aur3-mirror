# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-mvtnorm
pkgver=0.9_9991
pkgrel=1
pkgdesc="Multivariate normal and t distributions for the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/mvtnorm/index.html"
license=("GPL2")
depends=('r')
source=(http://cran.r-project.org/src/contrib/mvtnorm_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./mvtnorm
}
md5sums=('b6059751da050d9ad993ee5989a4a7c8')
