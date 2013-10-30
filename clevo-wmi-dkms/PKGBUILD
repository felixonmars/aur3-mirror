# Author: Christoph Jaeger <christophjaeger@linux.com>
# Maintainer: Marc Rozanc <marc@rozanc.fr>

pkgbase="clevo-wmi"
_modname="clevo-wmi"
pkgname="${pkgbase}-dkms"
pkgver="0.9.6"
pkgrel=4
pkgdesc='A reverse engineering driver for the Clevo P15SM/P17SM/W230ST/W350STQ/W370ST/W650SR/W670SR/W740SU backlight keyboard, by Christoph Jaeger (DKMS version)'
arch=('any')
license=('GPL')
url='http://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26&s=82130b57e71bd5b6ea569abc1424025c6f8d412d'
depends=('dkms' 'linux-headers')
provides=("clevo-wmi")
conflicts=("clevo_wmi-git" "clevo-wmi" "tuxedo-wmi" "tuxedo-wmi-dkms")
source=("http://repo.rozanc.fr/sources/clevo-wmi-${pkgver}.src.tar.gz"
        "dkms.conf.in")
md5sums=('b4c4046799dcf4497b75b794659fcae3'
         '885768a16582199937509d456b3475af')
install='clevo-wmi-dkms.install'


build() {
    cd "${srcdir}/clevo-wmi-${pkgver}/src"
    make
}

package() {
    cd "${srcdir}/clevo-wmi-${pkgver}/src"

    install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
    for i in "${srcdir}/${_modname}-${pkgver}/src/"{Makefile,clevo-wmi.c}; do
        install -D -m644 "${i}" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
    done
    sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}

