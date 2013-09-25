# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=r-cran-longitudinal
_cranname=longitudinal
pkgver=1.1.8
pkgrel=1
pkgdesc='General data structures and functions for longitudinal data with multiple variables, repeated measurements, and irregularly spaced time points'
url="http://cran.r-project.org/web/packages/$_cranname/index.html"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('r' 'r-cran-corpcor')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('ae29d436174db5bba59bbc7df4e8db71')

build() {
    mkdir -p "$pkgdir/usr/lib/R/library"
    cd "$srcdir"
    R CMD INSTALL $_cranname -l "$pkgdir/usr/lib/R/library"
    rm -f "$pkgdir/usr/lib/R/library/R.css"
}

