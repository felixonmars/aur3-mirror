# Maintainer: Oleg Smirnov <oleg.smirnov@gmail.com>
pkgname=r-cran-mix
pkgver=1.0_8
pkgrel=1
pkgdesc="Estimation/multiple imputation programs for mixed categorical and continuous data"
url="http://cran.r-project.org/web/packages/mix/index.html"
license=('custom')
arch=('i686' 'x86_64')
makedepends=('gcc-fortran')
depends=('r')
source=(http://cran.r-project.org/src/contrib/mix_1.0-8.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL mix -l ${pkgdir}/usr/lib/R/library
    rm -f ${pkgdir}/usr/lib/R/library/R.css
    if [ -f ${srcdir}/mix/LICENSE ]; then
         mkdir -p ${pkgdir}/usr/share/licenses/r-cran-mix
         install -m 644 ${srcdir}/mix/LICENSE ${pkgdir}/usr/share/licenses/r-cran-mix
    elif [ -f ${srcdir}/mix/LICENCE ]; then
         mkdir -p ${pkgdir}/usr/share/licenses/r-cran-mix
         install -m 644 ${srcdir}/mix/LICENCE ${pkgdir}/usr/share/licenses/r-cran-mix
    fi
}
md5sums=('541aa615c1cc5845cd1352682f6c3ef0')
