# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-colorbrewer
pkgver=1.0_5
pkgrel=2
pkgdesc="RColorBrewer provides palettes for drawing shaded maps for the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/RColorBrewer/index.html"
license=("Artistic-2.0")
depends=('r')
source=(http://cran.r-project.org/src/contrib/RColorBrewer_${pkgver//_/-}.tar.gz)

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./RColorBrewer
}
md5sums=('da52d639e105254e33346d5a39fa44d4')
