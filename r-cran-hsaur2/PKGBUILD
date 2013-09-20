# Maintainer: Matthias Hueser
pkgname=r-cran-hsaur2
pkgver=1.1.8
pkgrel=1
pkgdesc="Companion to Handbook of Statistical analysis using R"
url="http://www.crcpress.com/product/isbn/9781420079333"
license=('GPL (>= 2)')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' )
source=(http://cran.r-project.org/src/contrib/HSAUR2_1.1-8.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL HSAUR2 -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/hsaur2/${lic} ]; then
            install -Dm644 ${srcdir}/hsaur2/${lic} ${pkgdir}/usr/share/licenses/r-cran-hsaur2/${lic}
        fi
    done
}
md5sums=('12129c8cf3f9d214b6ed13937cd2a168')
