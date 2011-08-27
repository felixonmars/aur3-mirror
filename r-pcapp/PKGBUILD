# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-pcapp
pkgver=1.8_3
pkgrel=2
pkgdesc="Robust PCA by Projection Pursuit package for the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/pcaPP/index.html"
license=("GPL3")
depends=('r' 'r-mvtnorm')
source=(http://cran.r-project.org/src/contrib/pcaPP_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./pcaPP
}
md5sums=('e8172a0e9d5341882c5d4b345e716efc')
