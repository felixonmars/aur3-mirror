# Maintainer: Francois Garillot <francois[@]garillot.net>
pkgname=r-cran-psych
pkgver=1.2.12
pkgrel=1
pkgdesc="Procedures for Psychological, Psychometric, and Personality Research"
url="http://cran.r-project.org/web/packages/psych/index.html"
license=('GPL (>= 2)')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' )
optdepends=('r-cran-rgraphviz' 'r-cran-graph' 'r-cran-mvtnorm' 'r-cran-gparotation' 'r-cran-lavaan' 'r-cran-sem' 'r-cran-polycor' 'r-cran-rcsdp')
source=(http://cran.r-project.org/src/contrib/psych_$pkgver.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL psych -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/psych/${lic} ]; then
            install -Dm644 ${srcdir}/psych/${lic} ${pkgdir}/usr/share/licenses/r-cran-psych/${lic}
        fi
    done
}
md5sums=('eb640bd80819276e755352f4e703e81f')
