# Maintainer: NormalRa <normalrawr (moo) gmail (squeak) com>

_basename=acx-mac80211
pkgname=${_basename}-git
pkgver=1605.1daf4bf
pkgrel=3
pkgdesc="Kernel driver for TI ACX1xx based wireless cards (CardBus/PCI/USB)"
url="http://acx100.sourceforge.net/"
arch=('any')
license=('GPL')
depends=('linux>=3.10' 'acx111-firmware')
makedepends=('linux-headers' 'git')
options=('!strip')

source=("git://git.code.sf.net/p/acx100/${_basename}")

sha256sums=('SKIP')

install="${pkgname}.install"

_extramodules=extramodules-3.10-ARCH
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

pkgver() {
    cd "${_basename}"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}


build() {
    cd "${srcdir}/${_basename}"

    # Build module
    make -C /usr/lib/modules/${_kernver}/build M=`pwd` \
        CONFIG_ACX_MAC80211=m \
        CONFIG_ACX_MAC80211_PCI=y \
        CONFIG_ACX_MAC80211_USB=m \
        CONFIG_ACX_MAC80211_MEM=m \
        EXTRA_CFLAGS=" -DCONFIG_ACX_MAC80211=1 \
                        -DCONFIG_ACX_MAC80211_USB=1 \
                        -DCONFIG_ACX_MAC80211_MEM=1 \
                        -DCONFIG_ACX_MAC80211_PCI=1" \
        modules
}

package() {
    cd ${srcdir}/${_basename}

    install -D -m 644 ${_basename}.ko \
        "${pkgdir}/usr/lib/modules/${_extramodules}/${_basename}.ko"
    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/${_basename}.ko"

}
