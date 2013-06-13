# Contributor Alper Kanat <alperkanat@raptiye.org>
# Contributor Jaeic Lee <zeraxeal@gmail.com>
# Contributor Zhang Li <richselian@gmail.com>
# Based on rt2860 package from Marius Dransfeld <marius.dransfeld@gmail.com>

pkgname="rt3090-dkms"
pkgver="2.4.0.4"
pkgrel=1
pkgdesc="Drivers for rt3090 chipset wireless cards"
arch=("i686" "x86_64")
url="http://www.ralinktech.com/"
license="GPL"
depends=("dkms")
makedepends=()
replaces=("rt2860" "rt3090")
conflicts=("rt2860" "rt3090")
install="rt3090.install"

source=(
    "http://ppa.launchpad.net/markus-tisoft/rt3090/ubuntu/pool/main/r/rt3090/rt3090-dkms_2.4.0.4-0ubuntu0~ppa0_all.deb"
    "rt3090.conf"
    "rt3090.patch"
)
md5sums=(
    "f8f3f5574c31e088b3425795f7e82bfe"
    "6720a1f7b5185711ca78b730de58dc7c"
    "c95bad1b499b52649e6b6a6c5ea2d2ba"
)

build() {
    tar -xzvf       "${srcdir}/data.tar.gz"
    cd              "${srcdir}/usr/src/rt3090-2.4.0.4"
    patch -p1 <     "${srcdir}/rt3090.patch"
}

package() {
    cp -r           "${srcdir}/usr" "${pkgdir}/usr"
    cp -r           "${srcdir}/etc" "${pkgdir}/etc"
    install -Dm644  "${srcdir}/rt3090.conf" "${pkgdir}/etc/modprobe.d/rt3090.conf"
}
