# Maintainer: Tobias Neumann <mail at tobias dash neumann dot eu>
pkgname=r-scales
pkgver=0.2.3
pkgrel=1
pkgdesc="Scales map data to aesthetics, and provide methods for automatically determining breaks and labels for axes and legends."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/scales/index.html"
license=('MIT')
depends=('r' 'r-colorbrewer' 'r-stringr' 'r-plyr>=1.2' 'r-dichromat' 'r-labeling' 'r-munsell>=0.2')
source=(http://cran.r-project.org/src/contrib/scales_$pkgver.tar.gz)

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./scales

}
md5sums=('426e5a785d4bc5b9ba8aa10d2bc043a3')
