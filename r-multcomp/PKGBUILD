# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-multcomp
pkgver=1.2_6
pkgrel=1
pkgdesc="Simultaneous Inference in General Parametric Models for R."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/multcomp/index.html"
license=("GPL2")
depends=('r' 'r-mvtnorm')
source=(http://cran.r-project.org/src/contrib/multcomp_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./multcomp || return 1
}
md5sums=('e943bd61f5d0c00d0347592b83cf9840')
