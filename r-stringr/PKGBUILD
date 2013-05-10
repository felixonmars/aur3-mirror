# Maintainer: Tobias Neumann <mail at tobias dash neumann dot eu>

pkgname=r-stringr
pkgver=0.6.2
pkgrel=1
pkgdesc="Make it easier to work with strings"
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/stringr/index.html"
license=('GPL-2')
depends=('r' 'r-plyr')
source=(http://cran.r-project.org/src/contrib/stringr_$pkgver.tar.gz)

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./stringr
}

md5sums=('452628504e0910c1d0b1756370716f87')
