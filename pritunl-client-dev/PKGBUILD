# Maintainer: Pritunl <contact@pritunl.com>

pkgname=pritunl-client-dev
_pkgname=pritunl-client
pkgver=1.0.459.9snapshot1
pkgrel=1
pkgdesc="Pritunl VPN Client (Development Release)"
arch=("any")
license=("custom")
url="https://github.com/pritunl/${_pkgname}"
depends=(
    "python2"
    "net-tools"
    "iproute2"
    "openvpn"
)
makedepends=(
    "python2-distribute"
)
provides=("${_pkgname}")
conflicts=(
    "pritunl-client"
    "pritunl-client-dev"
    "pritunl-client-gtk"
    "pritunl-client-gtk-dev"
)
install=${_pkgname}.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=("9096cb66355953c5a7b22dfa8d3a258c882248250210b8450fdd96a7ad7b0b7d")
options=("emptydirs")
backup=(
    "var/log/${_pkgname}.log"
    "var/log/${_pkgname}.log.1"
)

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/etc/pritunl_client"
    python2 setup.py install --root="${pkgdir}" --prefix=/usr --no-upstart --no-gtk
}
