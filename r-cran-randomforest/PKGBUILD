# Maintainer: Francois Garillot <francois[@]garillot.net>
pkgname=r-cran-randomforest
pkgver=4.6_7
pkgrel=1
pkgdesc="Breiman and Cutler's random forests for classification and regression"
url="http://cran.r-project.org/web/packages/randomForest/index.html"
license=('GPL (>= 2)')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' )
optdepends=('r-cran-rcolorbrewer')
source=(http://cran.r-project.org/src/contrib/randomForest_4.6-7.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL randomForest -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/randomForest/${lic} ]; then
            install -Dm644 ${srcdir}/randomForest/${lic} ${pkgdir}/usr/share/licenses/r-cran-randomforest/${lic}
        fi
    done
}
md5sums=('cbf3b5620b864e8fd65d260f281bc23e')
