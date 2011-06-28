# Maintainer: Oleg Smirnov <oleg.smirnov@gmail.com>
pkgname=r-cran-rcolorbrewer
pkgver=1.0_5
pkgrel=1
pkgdesc="ColorBrewer palettes"
url="http://cran.r-project.org/web/packages/RColorBrewer/index.html"
license=('Apache License 2.0')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' )
optdepends=()
source=(http://cran.r-project.org/src/contrib/RColorBrewer_1.0-5.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL RColorBrewer -l ${pkgdir}/usr/lib/R/library
    rm -f ${pkgdir}/usr/lib/R/library/R.css
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/RColorBrewer/${lic} ]; then
            install -Dm644 ${srcdir}/RColorBrewer/${lic} ${pkgdir}/usr/share/licenses/r-cran-rcolorbrewer/${lic}
        fi
    done
}
md5sums=('da52d639e105254e33346d5a39fa44d4')
