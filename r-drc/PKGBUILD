# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-drc
pkgver=2.1_4
pkgrel=1
pkgdesc="Multiple concentration-response, dose-response and time-response curve analysis.  For the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/drc/index.html"
license=("GPL2")
depends=('r' 'r-alr3' 'r-gtools' 'r-magic' 'r-plotrix')
source=(http://cran.r-project.org/src/contrib/drc_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./drc
}
md5sums=('53ebd638b5666c3f453627e1714c8082')
