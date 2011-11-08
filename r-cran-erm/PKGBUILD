# Maintainer: Joris Wachter <joriswachter@gmail.com>

pkgname=r-cran-erm
pkgver=0.14
pkgrel=0
pkgdesc="Extended Rasch Modeling: Functions for estimating Rasch Model parameters and ICC plotting"
url="http://cran.r-project.org/web/packages/eRm/index.html"
license=('GPL version 2 or later')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' 'r-cran-rasch-sampler')
optdepends=()
source=(http://cran.r-project.org/src/contrib/eRm_0.14-0.tar.gz)
md5sums=('5f280a6616710cc08c731a86a379c3dd')

build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL eRm -l ${pkgdir}/usr/lib/R/library
    rm -f ${pkgdir}/usr/lib/R/library/R.css
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/eRm/${lic} ]; then
            install -Dm644 ${srcdir}/eRm/${lic} ${pkgdir}/usr/share/licenses/r-cran-eRm/${lic}
        fi
    done
}
 
