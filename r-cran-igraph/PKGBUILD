# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=r-cran-igraph
_cranname=igraph
pkgver=0.7.1
pkgrel=1
pkgdesc='Network analysis and visualization'
url="http://cran.r-project.org/web/packages/$_cranname/index.html"
license=('GPLv2' 'GPLv3')
arch=('i686' 'x86_64')
depends=('r')
makedepends=('gcc-fortran')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver/_/-}.tar.gz")
md5sums=('b234d163a74a1c988b7e88c664388bf5')

build() {
    mkdir -p "$pkgdir/usr/lib/R/library"
    cd "$srcdir"
    R CMD INSTALL $_cranname -l "$pkgdir/usr/lib/R/library"
    rm -f "$pkgdir/usr/lib/R/library/R.css"
}

