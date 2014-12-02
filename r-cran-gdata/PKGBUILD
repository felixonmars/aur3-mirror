pkgname=r-cran-gdata
pkgver=2.13.3
pkgrel=1
pkgdesc="Various R programming tools for data manipulation"
url="http://cran.r-project.org/web/packages/gdata/index.html"
license=('GPL-2')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' )
optdepends=('r-cran-runit')
source=(http://cran.r-project.org/src/contrib/gdata_2.13.3.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL gdata -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/gdata/${lic} ]; then
            install -Dm644 ${srcdir}/gdata/${lic} ${pkgdir}/usr/share/licenses/r-cran-gdata/${lic}
        fi
    done
}
md5sums=('99bb7e3e5acc4c3e43f88164126cbd04')
