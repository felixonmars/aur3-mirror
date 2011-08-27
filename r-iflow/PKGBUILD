# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-iflow
pkgver=2.4.0
pkgrel=1
pkgdesc="Bioconductor R package: GUI based visualization for flow cytometry."
arch=('i686' 'x86_64')
url="http://www.bioconductor.org/help/bioc-views/devel/bioc/html/iFlow.html"
license=("Artistic-2.0")
depends=('r' 'r-cairodevice' 'r-biobase' 'r-flowcore' 'r-flowviz' 'r-flowstats' 'r-rgtk2')
source=(http://www.bioconductor.org/packages/release/bioc/src/contrib/iFlow_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./iFlow
}
md5sums=('02b899d67f57d5383f0b751c502ae4b8')
