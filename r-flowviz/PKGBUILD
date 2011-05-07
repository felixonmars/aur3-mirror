# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-flowviz
pkgver=1.16.0
pkgrel=1
pkgdesc="flowViz: Visualization tools for flow cytometry data."
arch=('i686' 'x86_64')
url="http://www.bioconductor.org/packages/release/bioc/html/flowViz.html"
license=("Artistic-2.0")
depends=('r' 'r-flowcore' 'r-colorbrewer' 'r-latticeextra')
source=(http://www.bioconductor.org/packages/release/bioc/src/contrib/flowViz_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./flowViz
}
md5sums=('328f5a1979287a2a022794d4498aa0e3')
