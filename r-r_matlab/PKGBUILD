# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-r_matlab
pkgver=1.3.7
pkgrel=2
pkgdesc="Provides methods to read and write MAT files using the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/R.matlab/index.html"
license=("LGPL2.1")
depends=('r' 'r-r_oo')
source=(http://cran.r-project.org/src/contrib/R.matlab_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./R.matlab
}
md5sums=('c7897e337280a4bd3ce016af749f6648')
md5sums=('c7897e337280a4bd3ce016af749f6648')
