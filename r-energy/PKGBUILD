# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-energy
pkgver=1.3_0
pkgrel=1
pkgdesc="E-statistics (energy) for comparing distributions.  For the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/energy/index.html"
license=("GPL2")
depends=('r')
source=(http://cran.r-project.org/src/contrib/energy_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./energy
}
md5sums=('bc9c3a4de5446d713ef8cbcf7c86d3c9')
