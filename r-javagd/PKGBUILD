# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-javagd
pkgver=0.5_3
pkgrel=1
pkgdesc="Java Graphics Device for R."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/JavaGD/index.html"
license=("GPL2")
depends=('r' 'r-rjava')
source=(http://cran.r-project.org/src/contrib/JavaGD_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./JavaGD || return 1
 # If you get java errors, run R CMD javareconf as root
}
md5sums=('6344f87123902ad0d8c366b32281ab00')
