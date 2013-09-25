# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=r-cran-genenet
_cranname=GeneNet
pkgver=1.2.8
pkgrel=1
pkgdesc='Learning of large-scale gene association networks'
url="http://cran.r-project.org/web/packages/$_cranname/index.html"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('r' 'r-cran-longitudinal' 'r-cran-fdrtool' 'r-cran-igraph')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('cc175b1ceccdece887bf51fb1830b435')

build() {
    mkdir -p "$pkgdir/usr/lib/R/library"
    cd "$srcdir"
    R CMD INSTALL $_cranname -l "$pkgdir/usr/lib/R/library"
    rm -f "$pkgdir/usr/lib/R/library/R.css"
}

