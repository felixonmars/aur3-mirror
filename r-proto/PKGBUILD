# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-proto
pkgver=0.3_10
pkgrel=1
pkgdesc="An object oriented system using object-based ideas for the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/proto/index.html"
license=('GPL2')
depends=('r')
source=(http://cran.r-project.org/src/contrib/proto_${pkgver//_/-}.tar.gz)

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./proto
}
md5sums=('d5523943a5be6ca2f0ab557c900f8212')
