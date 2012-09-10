# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-iterators
pkgver=1.0.6
pkgrel=1
pkgdesc="An R package to traverse through all the elements of a vector, list, or other collection of data."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/iterators/index.html"
license=('APACHE')
depends=('r')
source=(http://cran.r-project.org/src/contrib/iterators_$pkgver.tar.gz)
md5sums=('8d5e2490a82e26533765a112fa7cb754')

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./iterators
}
