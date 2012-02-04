##### libancil ##############################
# Maintainer: matt mooney <mfm@muteddisk.com>

pkgname=libancil
pkgver=0.1.1
pkgrel=3
pkgdesc="A shared library for unix domain socket ancillary data."
arch=('i686' 'x86_64' 'ppc')
url="http://libancil.muteddisk.com"
license=('BSD')
depends=('glibc')
makedepends=('cmake>=2.4')
options=('strip')
source=("http://libancil.muteddisk.com/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('31efa809071705697f0cfc17bbda80f3660629ecfe7699628e18175cb9d62e7a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cmake -D CMAKE_INSTALL_PREFIX=${pkgdir}/usr $(pwd)
    make ancil
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make install
    install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname}
    ln -sf /usr/share/doc/${pkgname}/LICENSE \
       ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
