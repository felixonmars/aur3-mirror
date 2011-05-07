# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-fda
pkgver=2.2.6
pkgrel=1
pkgdesc="Functional Data Analysis: as described in Ramsay, J. O. and Silverman, B. W. (2005). For the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/fda/index.html"
license=("GPL2")
depends=('r' 'r-zoo')
source=(http://cran.r-project.org/src/contrib/fda_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./fda
}
md5sums=('92ce1c2b567b5dd87a874d405b30bd04')
