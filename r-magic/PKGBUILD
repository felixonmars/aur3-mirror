# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-magic
pkgver=1.4_6
pkgrel=2
pkgdesc="A collection of vectorized algorithms for magic squares and hypercubes.  For the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/magic/index.html"
license=("GPL2")
depends=('r' 'r-abind')
source=(http://cran.r-project.org/src/contrib/magic_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./magic
}
md5sums=('436eacdd3c01a7648469ab21b14de894')
