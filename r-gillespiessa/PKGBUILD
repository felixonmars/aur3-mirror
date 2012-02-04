# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-gillespiessa
pkgver=0.5_4
pkgrel=2
pkgdesc="GillespieSSA provides a simple to use, intuitive, and extensible interface to several stochastic simulation algorithms.  For the R 
language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/GillespieSSA/index.html"
license=("GPL3")
depends=('r')
source=(http://cran.r-project.org/src/contrib/GillespieSSA_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./GillespieSSA
}
md5sums=('54e986a92d2081c28afdc9265252720c')
