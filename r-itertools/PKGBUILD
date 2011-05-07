# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-itertools
pkgver=0.1_1
pkgrel=2
pkgdesc="Various R tools for creating iterators, many patterned after functions in the Python itertools module."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/itertools/index.html"
license=('GPL2')
depends=('r' 'r-iterators')
source=(http://cran.r-project.org/src/contrib/itertools_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./itertools
}
md5sums=('9342685bff041f9755910ad81c5f92c2')
