# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-colorspace
pkgver=1.2_4
pkgrel=1
pkgdesc="Carries out mapping between assorted color spaces.  For the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/colorspace/index.html"
license=('BSD')
depends=('r')
source=('http://cran.r-project.org/src/contrib/colorspace_1.2-4.tar.gz')

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./colorspace
}
md5sums=('1f9a05587ffae27fc3e4da7503d016fc')
