# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-annotationdbi
pkgver=1.14.1
pkgrel=1
pkgdesc="Bioconductor Annotation Database Interface for the R language."
arch=('i686' 'x86_64')
url="http://www.bioconductor.org/packages/release/bioc/html/AnnotationDbi.html"
license=("Artistic-2.0")
depends=('r' 'r-biobase' 'r-dbi' 'r-sqlite')
source=(http://www.bioconductor.org/packages/release/bioc/src/contrib/AnnotationDbi_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./AnnotationDbi
}
md5sums=('8549eb5debb0bc0e403d106bcf297831')
