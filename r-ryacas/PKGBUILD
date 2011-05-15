# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-ryacas
pkgver=0.2_10
pkgrel=1
pkgdesc="R interface to the yacas computer algebra system."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/Ryacas/index.html"
license=("GPL2")
depends=('r' 'r-xml')
source=(http://cran.r-project.org/src/contrib/Ryacas_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./Ryacas || return 1
}
md5sums=('dff9158898efe9d09d7611dd6a167a76')
