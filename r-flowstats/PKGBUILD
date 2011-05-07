# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-flowstats
pkgver=1.10.0
pkgrel=1
pkgdesc="Bioconductor package: statistical methods for the analysis of flow cytometry data for the R language."
arch=('i686' 'x86_64')
url="http://www.bioconductor.org/help/bioc-views/release/bioc/html/flowStats.html"
license=("Artistic-2.0")
depends=('r' 'r-flowcore' 'r-fda' 'r-mvoutlier')
#source=(http://www.bioconductor.org/packages/2.7/bioc/src/contrib/flowStats_$pkgver.tar.gz)
source=(http://www.bioconductor.org/packages/release/bioc/src/contrib/flowStats_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./flowStats
}
md5sums=('320f25a4e182638a0c7aeae2dc04856e')
