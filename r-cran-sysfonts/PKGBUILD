pkgname=r-cran-sysfonts
pkgver=0.2
pkgrel=1
pkgdesc="Loading system fonts into R"
url="http://cran.r-project.org/web/packages/sysfonts/index.html"
license=('GPL-2')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' )
optdepends=('r-cran-jsonlite' 'r-cran-rcurl')
source=(http://cran.r-project.org/src/contrib/sysfonts_0.2.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL sysfonts -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/sysfonts/${lic} ]; then
            install -Dm644 ${srcdir}/sysfonts/${lic} ${pkgdir}/usr/share/licenses/r-cran-sysfonts/${lic}
        fi
    done
}
md5sums=('87eb9437c2224e14a8f43b785b98981d')
