pkgname=r-cran-zoo
pkgver=1.7_11
pkgrel=1
pkgdesc="S3 Infrastructure for Regular and Irregular Time Series (Z's ordered observations)"
url="http://cran.r-project.org/web/packages/zoo/index.html"
license=('GPL-2' 'GPL-3')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' )
optdepends=('r-cran-fts' 'r-cran-xts' 'r-cran-mondate' 'r-cran-scales' 'r-cran-strucchange' 'r-cran-coda' 'r-cran-timedate' 'r-cran-daag' 'r-cran-ggplot2' 'r-cran-timeseries' 'r-cran-tseries' 'r-cran-tis' 'r-cran-its' 'r-cran-chron')
source=(http://cran.r-project.org/src/contrib/zoo_1.7-11.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL zoo -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/zoo/${lic} ]; then
            install -Dm644 ${srcdir}/zoo/${lic} ${pkgdir}/usr/share/licenses/r-cran-zoo/${lic}
        fi
    done
}
md5sums=('7cafa41c1ba7b794153c639a6f315295')
