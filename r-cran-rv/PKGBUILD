# Maintainer: Francois Garillot <francois[@]garillot.net>
pkgname=r-cran-rv
pkgver=2.2.1
pkgrel=1
pkgdesc="Simulation-based random variable object class in R"
url="http://cran.r-project.org/web/packages/rv/index.html"
license=('GPL-2')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' )
optdepends=()
source=(http://cran.r-project.org/src/contrib/rv_2.2.1.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL rv -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/rv/${lic} ]; then
            install -Dm644 ${srcdir}/rv/${lic} ${pkgdir}/usr/share/licenses/r-cran-rv/${lic}
        fi
    done
}
md5sums=('a5999939e8613d1b810bfe380fb244b5')
