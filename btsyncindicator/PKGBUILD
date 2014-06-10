# Maintainer: Martin Wimpress <code@flexion.org>

pkgname=btsyncindicator
pkgver=0.16
pkgrel=1
pkgdesc="Bittorrent Sync indicator for Linux desktops."
arch=('any')
url="https://github.com/marxjohnson/btsyncindicator"
license=('GPL3')
depends=('btsync' 'libappindicator' 'python2' 'python2-requests' 'pygtk')
optdepends=('btsync-autoconfig: Create default config files when launching btsync@user, if necessary')
source=("https://github.com/marxjohnson/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('c17564887b5ab0bfe5641dfb4325c169215f5645')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's/env python/env python2/' ${pkgname}.py
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 0755 ${pkgname}.py "${pkgdir}/usr/bin/${pkgname}"
    for ICON in icons/*
    do
        install -D -m 0644 ${ICON} "${pkgdir}/usr/share/pixmaps/${pkgname}/"$(basename ${ICON})
    done
}
