# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-effects
pkgver=2.0_12
pkgrel=1
pkgdesc="Effects displays for statistical models for R."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/effects/index.html"
license=("GPL2")
depends=('r' 'r-colorspace')
source=(http://cran.r-project.org/src/contrib/effects_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./effects || return 1
}
md5sums=('643169044c8cc624b9d5915570bfdf7a')
