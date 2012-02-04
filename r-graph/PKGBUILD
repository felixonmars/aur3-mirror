# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-graph
pkgver=1.30.0
pkgrel=1
pkgdesc="A simple graph handling implementation for the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/graph/index.html"
license=("Artistic-2.0")
depends=('r')
source=(http://cran.r-project.org/src/contrib/graph_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./graph
}
md5sums=('f4b25bad720bab8aad1edf9075a0998d')
