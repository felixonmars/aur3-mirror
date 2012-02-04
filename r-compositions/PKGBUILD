# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-compositions
pkgver=1.10_1
pkgrel=1
pkgdesc="Functions for the consistent analysis of compositional data and positive numbers, for R."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/compositions/index.html"
license=("LGPL2.1")
depends=('r' 'r-energy' 'r-rgl' 'r-tensora')
source=(http://cran.r-project.org/src/contrib/compositions_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./compositions
}
md5sums=('81395da5dfc1c861cccd3166f91b2d05')
