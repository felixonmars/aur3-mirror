# Maintainer: Zachary Huff <zach.huff.386@gmail.com>

pkgname=drivnal
pkgver=0.10.1
pkgrel=1
pkgdesc="Linux backup utility with web interface"
arch=("any")
license=("AGPL3")
url="https://github.com/${pkgname}/${pkgname}"
depends=(
    "python2"
    "python2-flask"
    "python2-cherrypy"
    "rsync"
)
makedepends=(
    "python2-distribute"
)
provides=("${pkgname}")
conflicts=("${pkgname}")
install=${pkgname}.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=("4fb5d1b6cc6e37b7127eab4fdbc1b45b0a3cdb0af0d457a1e1a192297d3a6c33")
options=("emptydirs")
backup=(
    "etc/${pkgname}.conf"
    "var/lib/${pkgname}/${pkgname}.db"
    "var/log/${pkgname}.log"
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/var/lib/${pkgname}"
    python2 setup.py install --root="${pkgdir}" --prefix=/usr --no-upstart
}
