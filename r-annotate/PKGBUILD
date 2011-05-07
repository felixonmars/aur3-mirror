# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-annotate
pkgver=1.30.0
pkgrel=1
pkgdesc="Biocore annotation for microarrays for the R language"
arch=('i686' 'x86_64')
url="http://www.bioconductor.org/packages/release/bioc/html/annotate.html"
license=("Artistic-2.0")
depends=('r' 'r-annotationdbi' 'r-xtable')
source=(http://www.bioconductor.org/packages/release/bioc/src/contrib/annotate_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./annotate
}
md5sums=('a2f48bd0785383e45a3a38be3719873c')
