# Maintainer: Tom Kazimiers <tom@voodoo-arts.net>
pkgname=r-cran-quadprog
pkgver=1.5_4
pkgrel=1
pkgdesc="Functions to solve Quadratic Programming Problems from within the R project environment."
url="http://cran.r-project.org/web/packages/quadprog"
license=('GPL-2')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran' 'r')
depends=('r' )
optdepends=()
source=(http://cran.r-project.org/src/contrib/quadprog_1.5-4.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL quadprog -l ${pkgdir}/usr/lib/R/library
    rm -f ${pkgdir}/usr/lib/R/library/R.css
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/quadprog/${lic} ]; then
            install -Dm644 ${srcdir}/quadprog/${lic} ${pkgdir}/usr/share/licenses/r-cran-quadprog/${lic}
        fi
    done
}
md5sums=('34dd39e1131d4b5f8d458deeaf485335')
