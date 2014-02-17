pkgname=r-cran-showtext
pkgver=0.2
pkgrel=1
pkgdesc="Enable (any) R Graphics Device to Show Text Using System Fonts"
url="http://cran.r-project.org/web/packages/showtext/index.html"
license=('Apache License (>= 2.0)')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' 'r-cran-sysfonts')
optdepends=()
source=(http://cran.r-project.org/src/contrib/showtext_0.2.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL showtext -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/showtext/${lic} ]; then
            install -Dm644 ${srcdir}/showtext/${lic} ${pkgdir}/usr/share/licenses/r-cran-showtext/${lic}
        fi
    done
}
md5sums=('765090f26d8d6d41c0fc680adaf415fb')
