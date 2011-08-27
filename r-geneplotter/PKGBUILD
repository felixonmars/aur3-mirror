# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-geneplotter
pkgver=1.30.0
pkgrel=1
pkgdesc="Bioconductor basic genetic data plotter for the R language."
arch=('i686' 'x86_64')
url="http://www.bioconductor.org/packages/release/bioc/html/geneplotter.html"
license=("Artistic-2.0")
depends=('r' 'r-biobase' 'r-colorbrewer' 'r-annotate')
source=(http://www.bioconductor.org/packages/release/bioc/src/contrib/geneplotter_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./geneplotter
}
md5sums=('b35e7a63fa704b3e47e270f2115f2972')
