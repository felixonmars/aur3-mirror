# Maintainer: Tobias Neumann <mail at tobias dash neumann dot eu>
pkgname=r-reshape2
pkgver=1.2.2
pkgrel=1
pkgdesc="Reshape lets you flexibly restructure and aggregate data using just two functions: melt and cast."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/reshape2/index.html"
license=('MIT')
depends=('r' 'r-plyr>=1.5' 'r-stringr')
source=(http://cran.r-project.org/src/contrib/reshape2_$pkgver.tar.gz)

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./reshape2
}

md5sums=('4b13c53b2a184c0498b351608ff8a085')
