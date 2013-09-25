# Maintainer: Oleg Smirnov <oleg.smirnov@gmail.com>
pkgname=r-cran-mclust
pkgver=4.2
pkgrel=1
pkgdesc="Model-Based Clustering / Normal Mixture Modeling"
url="http://cran.r-project.org/web/packages/mclust/index.html"
license=('custom:LICENSE')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=()
optdepends=('r-cran-mix')
source=("http://cran.r-project.org/src/contrib/mclust_$pkgver.tar.gz")
md5sums=('94e0372120b0f3c0b9a9b88af5c9b06c')

build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL mclust -l ${pkgdir}/usr/lib/R/library
    rm -f ${pkgdir}/usr/lib/R/library/R.css
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/mclust/${lic} ]; then
            install -Dm644 ${srcdir}/mclust/${lic} ${pkgdir}/usr/share/licenses/r-cran-mclust/${lic}
        fi
    done
}

