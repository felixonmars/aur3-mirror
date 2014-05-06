# Maintainer: Francois Garillot <francois[@]garillot.net>
pkgname=r-cran-car
pkgver=2.0_20
pkgrel=1
pkgdesc="Companion to Applied Regression"
url="http://cran.r-project.org/web/packages/car/index.html"
license=('GPL (>= 2)')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' )
optdepends=('r-cran-sandwich' 'r-cran-alr3' 'r-cran-pbkrtest' 'r-cran-lmtest' 'r-cran-leaps' 'r-cran-survey' 'r-cran-lme4' 'r-cran-rgl' 'r-cran-quantreg')
source=(http://cran.r-project.org/src/contrib/car_2.0-20.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL car -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/car/${lic} ]; then
            install -Dm644 ${srcdir}/car/${lic} ${pkgdir}/usr/share/licenses/r-cran-car/${lic}
        fi
    done
}
md5sums=('d1d8f2648595bba65285fd9c13b35f98')
