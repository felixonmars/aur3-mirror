# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-plotrix
pkgver=3.2
pkgrel=1
pkgdesc="Lots of plots, various labeling, axis and color scaling functions for the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/plotrix/index.html"
license=("GPL2")
depends=('r')
source=(http://cran.r-project.org/src/contrib/plotrix_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./plotrix
}
md5sums=('7f15e5d30021e29c5851a2013ca375bd')
