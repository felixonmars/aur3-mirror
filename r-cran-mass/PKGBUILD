# Maintainer: Matthias Hueser
pkgname=r-cran-mass
pkgver=7.3_29
pkgrel=1
pkgdesc="Functions and datasets to support Modern Applied Statistics with S"
url="http://www.stats.ox.ac.uk/pub/MASS4/"
license=('GPL (>= 2)')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r')
source=(http://cran.r-project.org/src/contrib/MASS_7.3-29.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL MASS -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/mass/${lic} ]; then
            install -Dm644 ${srcdir}/mass/${lic} ${pkgdir}/usr/share/licenses/r-cran-mass/${lic}
        fi
    done
}
md5sums=('b42209288d1650588f33816030dba9a0')
