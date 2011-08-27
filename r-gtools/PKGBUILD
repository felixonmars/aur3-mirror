# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-gtools
pkgver=2.6.2
pkgrel=1
pkgdesc="Various R programming tools."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/gtools/index.html"
license=("LGPL2.1")
depends=('r')
source=(http://cran.r-project.org/src/contrib/gtools_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./gtools
}
md5sums=('486964f087eae19806392eb6d4817aa9')
