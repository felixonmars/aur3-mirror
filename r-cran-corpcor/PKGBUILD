# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=r-cran-corpcor
_cranname=corpcor
pkgver=1.6.6
pkgrel=1
pkgdesc='Efficient shrinkage estimator for well-conditioned covariance matrices'
url="http://cran.r-project.org/web/packages/$_cranname/index.html"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('e1ea3f8502991b51d5677edd2045a479')

build() {
    mkdir -p "$pkgdir/usr/lib/R/library"
    cd "$srcdir"
    R CMD INSTALL $_cranname -l "$pkgdir/usr/lib/R/library"
    rm -f "$pkgdir/usr/lib/R/library/R.css"
}

