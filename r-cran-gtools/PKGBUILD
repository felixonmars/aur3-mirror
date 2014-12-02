pkgname=r-cran-gtools
pkgver=3.4.1
pkgrel=1
pkgdesc="Various R programming tools"
url="http://cran.r-project.org/web/packages/gtools/index.html"
license=('LGPL-2.1')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' )
optdepends=()
source=(http://cran.r-project.org/src/contrib/gtools_3.4.1.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL gtools -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/gtools/${lic} ]; then
            install -Dm644 ${srcdir}/gtools/${lic} ${pkgdir}/usr/share/licenses/r-cran-gtools/${lic}
        fi
    done
}
md5sums=('4244d85b07713982fe291f67e4bc18be')
