pkgname=r-cran-rocr
pkgver=1.0_5
pkgrel=1
pkgdesc="Visualizing the performance of scoring classifiers."
url="http://cran.r-project.org/web/packages/ROCR/index.html"
license=('GPL (>= 2)')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' 'r-cran-gplots')
optdepends=()
source=(http://cran.r-project.org/src/contrib/ROCR_1.0-5.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ROCR -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/ROCR/${lic} ]; then
            install -Dm644 ${srcdir}/ROCR/${lic} ${pkgdir}/usr/share/licenses/r-cran-rocr/${lic}
        fi
    done
}
md5sums=('ed80ddfc995453d16cdf7d2944959363')
