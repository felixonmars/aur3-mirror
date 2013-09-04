# Maintainer: NormalRa <normalrawr (moo) gmail (squeak) com>

_basename=acx-mac80211
pkgname=${_basename}-dkms-git
pkgver=1605.1daf4bf
pkgrel=3
pkgdesc="Kernel driver for TI ACX1xx based wireless cards (CardBus/PCI/USB) with DKMS support"
url="http://acx100.sourceforge.net/"
arch=('any')
license=('GPL2')
depends=('dkms' 'acx111-firmware')
makedepends=('linux-headers' 'git')
options=('!strip')

install="${pkgname}.install"

source=("git://git.code.sf.net/p/acx100/${_basename}"
        "dkms.conf.in")

sha256sums=('SKIP'
            '978183b9792f62d51db502b66f45cade9355769c63113832b03c31821c98e3c2')


pkgver() {
    cd "${_basename}"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
    # Create dkms.conf
    sed -e "s/@PKGVER@/${pkgver}/" < ${srcdir}/dkms.conf.in > dkms.conf
}

package() {
    cd ${srcdir}/${_basename}
    install -dm755 "${pkgdir}/usr/src/${_basename}-${pkgver}/"
    cp -r * ${pkgdir}/usr/src/${_basename}-${pkgver}/
}
