# Maintainer: Phil Schaf

pkgname=r-cran-clustergeneration
_cranname=clusterGeneration
pkgver=1.3.1
pkgrel=1
pkgdesc='Generation of random clusters and covariance/correlation matrices, calculation of separation indices and visualization of clusters'
url="http://cran.r-project.org/web/packages/$_cranname/index.html"
license=('GPLv2' 'GPLv3')
arch=('i686' 'x86_64')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('d57ecb3904cffaa6d418dc04bde56741')

build() {
    mkdir -p "$pkgdir/usr/lib/R/library"
    cd "$srcdir"
    R CMD INSTALL clusterGeneration -l "$pkgdir/usr/lib/R/library"
    rm -f "$pkgdir/usr/lib/R/library/R.css"
}

