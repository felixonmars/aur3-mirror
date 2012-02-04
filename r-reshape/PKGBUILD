# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-reshape
pkgver=0.8.4
pkgrel=1
pkgdesc="Reshape lets you flexibly restructure and aggregate data using just two functions: melt and cast.  For the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/reshape/index.html"
license=('MIT')
depends=('r' 'r-plyr')
source=(http://cran.r-project.org/src/contrib/reshape_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./reshape

 #reshape doesn't come with a license spelled out in its entirety, it just says 'MIT'
 install -D -m644 $srcdir/reshape/DESCRIPTION $pkgdir/usr/share/licenses/r-reshape/DESCRIPTION
}
md5sums=('eade37fd6dc3b2f12207b5eb259ab41f')
