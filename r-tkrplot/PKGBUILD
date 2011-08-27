# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-tkrplot
pkgver=0.0_20
pkgrel=1
pkgdesc="Tk widget for holding R plots."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/tkrplot/index.html"
license=("LGPL2.1")
depends=('r' 'tk')
source=(http://cran.r-project.org/src/contrib/tkrplot_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./tkrplot
}
md5sums=('802fadfca82da9c94a6daf2126567060')
