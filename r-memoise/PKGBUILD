# Maintainer: Tobias Neumann <mail at tobias dash neumann dot eu>
pkgname=r-memoise
pkgver=0.1
pkgrel=1
pkgdesc="Cache the results of a function so that when you call it again with the same arguments it returns the pre-computed value."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/memoise/index.html"
license=('MIT')
depends=('r' 'r-digest')
source=(http://cran.r-project.org/src/contrib/memoise_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./memoise
}
md5sums=('8d0000e942cfc3758bc347bd47658afc')
