# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-drm
pkgver=0.5_8
pkgrel=2
pkgdesc="Likelihood-based marginal regression and association modelling for the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/drm/index.html"
license=("GPL2")
depends=('r')
source=(http://cran.r-project.org/src/contrib/drm_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./drm
}
md5sums=('a4e9fa6b648421cb42bc0e51228d3b97')
