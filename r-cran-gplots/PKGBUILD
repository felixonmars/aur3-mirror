pkgname=r-cran-gplots
pkgver=2.14.2
pkgrel=1
pkgdesc="Various R programming tools for plotting data"
url="http://cran.r-project.org/web/packages/gplots/index.html"
license=('GPL-2')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' )
optdepends=()
source=(http://cran.r-project.org/src/contrib/gplots_2.14.2.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL gplots -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/gplots/${lic} ]; then
            install -Dm644 ${srcdir}/gplots/${lic} ${pkgdir}/usr/share/licenses/r-cran-gplots/${lic}
        fi
    done
}
md5sums=('5f6fa4f937eea7ff73198a80bc5d6d55')
