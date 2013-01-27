# Maintainer: Francois Garillot <francois[@]garillot.net>
pkgname=r-cran-lsr
pkgver=0.2.2
pkgrel=2
pkgdesc='Companion to "Learning Statistics with R"'
url="http://cran.r-project.org/web/packages/lsr/index.html"
license=('GPL-3')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' )
optdepends=()
source=(http://cran.r-project.org/src/contrib/lsr_$pkgver.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL lsr -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/lsr/${lic} ]; then
            install -Dm644 ${srcdir}/lsr/${lic} ${pkgdir}/usr/share/licenses/r-cran-lsr/${lic}
        fi
    done
}
md5sums=('e9631a269c96854baec36dea2e0201b7')
