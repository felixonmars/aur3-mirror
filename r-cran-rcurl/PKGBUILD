# Maintainer: Francois Garillot <francois[@]garillot.net>
pkgname=r-cran-rcurl
pkgver=1.95_4.1
pkgrel=1
pkgdesc="General network (HTTP/FTP/...) client interface for R"
url="http://cran.r-project.org/web/packages/RCurl/index.html"
license=('BSD')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' 'r-cran-bitops')
optdepends=('r-cran-xml' 'r-cran-rcompression')
source=(http://cran.r-project.org/src/contrib/RCurl_1.95-4.1.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL RCurl -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/RCurl/${lic} ]; then
            install -Dm644 ${srcdir}/RCurl/${lic} ${pkgdir}/usr/share/licenses/r-cran-rcurl/${lic}
        fi
    done
}
md5sums=('ae05762f9dceb92e9aa95417399ce931')
