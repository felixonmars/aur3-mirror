# Maintainer: Joris Wachter <joriswachter@gmail.com>

pkgname=r-cran-rasch-sampler
pkgver=0.8
pkgrel=5
pkgdesc="Rasch Sampler: Sampling binary matrices with fixed margins"
url="http://cran.r-project.org/web/packages/RaschSampler/index.html"
license=('GPL version 2 or later')
arch=('i686' 'x86_64')
makedepends=('gcc gcc-fortran')
depends=('r')
optdepends=()
source=(http://cran.r-project.org/src/contrib/RaschSampler_0.8-5.tar.gz)
md5sums=('f076f460cfe9ddfb08af22b5fe8e00ac')

build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL RaschSampler -l ${pkgdir}/usr/lib/R/library
    rm -f ${pkgdir}/usr/lib/R/library/R.css
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/RaschSampler/${lic} ]; then
            install -Dm644 ${srcdir}/RaschSampler/${lic} ${pkgdir}/usr/share/licenses/r-cran-RaschSampler/${lic}
        fi
    done
}
 
