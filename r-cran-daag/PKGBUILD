# Maintainer: Francois Garillot <francois[@]garillot.net>
pkgname=r-cran-daag
pkgver=1.15
pkgrel=1
pkgdesc="Data Analysis And Graphics data and functions"
url="http://cran.r-project.org/web/packages/DAAG/index.html"
license=('Unlimited')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' 'r-cran-randomforest' 'r-cran-latticeextra')
optdepends=('r-cran-lme4' 'r-cran-leaps' 'r-cran-oz' 'r-cran-quantreg')
source=(http://cran.r-project.org/src/contrib/DAAG_1.15.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL DAAG -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/DAAG/${lic} ]; then
            install -Dm644 ${srcdir}/DAAG/${lic} ${pkgdir}/usr/share/licenses/r-cran-daag/${lic}
        fi
    done
}
md5sums=('5ba5389497ed3fd32b9749efb9e178d9')
