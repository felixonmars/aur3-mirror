
# $Id$
# Maintainer : DUCRETTET Philippe <ecolinux@gmx.fr>

pkgname=flashplugin-no-sse2
name=flashplugin
_licensefile='PlatformClients_PC_WWEULA_Combined_20100108_1657.pdf'
pkgver=11.1.102.55
pkgrel=1
pkgdesc='Adobe Flash Player for no sse2 32 bits processor'
url='http://get.adobe.com/flashplayer'
arch=('i686')
depends=('mozilla-common' 'libxt' 'gtk2' 'nss' 'curl' 'hicolor-icon-theme')
optdepends=('libvdpau: GPU acceleration on Nvidia card')
provides=('flashplayer')
license=('custom')
options=(!strip)
install=flashplugin.install
backup=(etc/adobe/mms.cfg)

source=("http://cekirdek.pardus.org.tr/~farslan/dist/${name}/${name}-${pkgver}-i386.tar.gz"
        "http://www.adobe.com/products/eulas/pdfs/${_licensefile}"
        mms.cfg)

package () {
    cd ${srcdir}/${name}-${pkgver}-i386
    install -Dm755 libflashplayer.so "${pkgdir}/usr/lib/mozilla/plugins/libflashplayer.so"
    install -Dm755 usr/lib/kde4/kcm_adobe_flash_player.so "${pkgdir}/usr/lib/kde4/kcm_adobe_flash_player.so"
    install -Dm755 usr/bin/flash-player-properties "${pkgdir}/usr/bin/flash-player-properties"
    for i in 16x16 22x22 24x24 32x32 48x48; do
        install -Dm644 usr/share/icons/hicolor/${i}/apps/flash-player-properties.png \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/flash-player-properties.png"
    done
    install -Dm644 usr/share/applications/flash-player-properties.desktop "${pkgdir}/usr/share/applications/flash-player-properties.desktop"
    install -Dm644 usr/share/kde4/services/kcm_adobe_flash_player.desktop "${pkgdir}/usr/share/kde4/services/kcm_adobe_flash_player.desktop"
cd ${srcdir}
    install -Dm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
    install -Dm644 ${srcdir}/mms.cfg "${pkgdir}/etc/adobe/mms.cfg"
}

md5sums=('90b1c65e004066c60f47769eb7f94158'
         '94ca2aecb409abfe36494d1a7ec7591d'
         'f34aae6279b40e0bd2abfb0d9963d7b8')
