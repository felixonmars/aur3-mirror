# Maintainer: Matthias Hueser
pkgname=r-cran-mva
pkgver=1.0_3
pkgrel=1
pkgdesc="Functions, data sets, analyses and examples from the book An Introduction to Applied Multivariate Analysis with R"
url="http://dx.doi.org/10.1007/978-1-4419-9650-3"
license=('GPL (>= 2)')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' 'r-cran-hsaur2')
source=(http://cran.r-project.org/src/contrib/MVA_1.0-3.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL MVA -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/mva/${lic} ]; then
            install -Dm644 ${srcdir}/mva/${lic} ${pkgdir}/usr/share/licenses/r-cran-mva/${lic}
        fi
    done
}
md5sums=('258724d5e60a11b27c41320e1a210e04')
