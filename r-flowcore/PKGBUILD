# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-flowcore
pkgver=1.18.0
pkgrel=1
pkgdesc="flowCore: Basic flow cytometry data structures for the R language."
arch=('i686' 'x86_64')
url="http://www.bioconductor.org/packages/release/bioc/html/flowCore.html"
license=("Artistic-2.0")
depends=('r' 'r-biobase' 'r-feature' 'r-graph' 'r-rrcov')
source=(http://www.bioconductor.org/packages/release/bioc/src/contrib/flowCore_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./flowCore
}
md5sums=('216dff98ec29a622e826614bcaaec762')
