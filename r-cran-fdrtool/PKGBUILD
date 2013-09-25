# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=r-cran-fdrtool
_cranname=fdrtool
pkgver=1.2.11
pkgrel=1
pkgdesc='Estimate both tail area-based false discovery rates (Fdr) as well as local false discovery rates (fdr) for a variety of null models (p-values, z-scores, correlation coefficients, t-scores)'
url="http://cran.r-project.org/web/packages/$_cranname/index.html"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('95d453b7ea8ded3b90b32f3ce3451141')

build() {
    mkdir -p "$pkgdir/usr/lib/R/library"
    cd "$srcdir"
    R CMD INSTALL $_cranname -l "$pkgdir/usr/lib/R/library"
    rm -f "$pkgdir/usr/lib/R/library/R.css"
}

