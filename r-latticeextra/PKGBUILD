# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-latticeextra
pkgver=0.6_18
pkgrel=1
pkgdesc="Extra graphical utilities based on lattice.  For the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/latticeExtra/index.html"
license=("GPL2")
depends=('r' 'r-colorbrewer')
source=(http://cran.r-project.org/src/contrib/latticeExtra_0.6-18.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./latticeExtra
}
md5sums=('8a34e8b5c5271a529c39c4918602a857')
