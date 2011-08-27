# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-tensora
pkgver=0.36
pkgrel=1
pkgdesc="Advanced linear algebra and computation with tensors for the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/tensorA/index.html"
license=("GPL2")
depends=('r')
source=(http://cran.r-project.org/src/contrib/tensorA_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./tensorA
}
md5sums=('01c0613491d9b46600bf403d7e3bdd80')
