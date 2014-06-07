# Maintainer: CyrIng <xfreq[at]cyring.fr>

pkgname=xfreq-git
pkgver=1.0.rc1
pkgrel=1
pkgdesc="Intel Core Monitoring Widgets"
arch=('x86_64')
url="http://code.google.com/p/xfreq/"
license=('GPL2')
depends=('libx11')
makedepends=('libx11')
options=('!emptydirs')
source=(${pkgname}::git+https://code.google.com/p/xfreq/)
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
        cd "${srcdir}/${pkgname}"
        make
}

package() {
        mkdir -p ${pkgdir}/usr/bin
        cd "${srcdir}/${pkgname}"
        install -m 755 bin/xfreq ${pkgdir}/usr/bin/
}
