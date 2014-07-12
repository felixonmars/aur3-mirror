# $Id$
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

# On 2013-09-12, the shared-mime-info package changed the MIME type for Flash
# files from application/x-shockwave-flash to application/vnd.adobe.flash.movie
# (http://cgit.freedesktop.org/xdg/shared-mime-info/commit/?id=2d385ff07eae60f9d92bf932ed7e95fa94dc276d).
# As a side-effect, Firefox no longer allowed local (file://) Flash files to be
# played in the browser. This package works around the issue by modifiying the
# Flash binary to accept the application/vnd.adobe.flash.movie MIME type.
#
# You can verify it by opening your browser and checking about:plugins. You
# should see
#
#     application/x-shockwave-flash        Shockwave Flash    swf
#     application/vnd.adobe.flash.movie    ash Player         swf
#
# as the accepted MIME types.

pkgname=flashplugin-mimefix
_licensefile='PlatformClients_PC_WWEULA_Combined_20100108_1657.pdf'
pkgver=11.2.202.394
pkgrel=1
pkgdesc='Adobe Flash Player, patched to accept application/vnd.adobe.flash.movie MIME type'
url='http://get.adobe.com/flashplayer'
arch=('x86_64')
depends=('mozilla-common' 'libxt' 'libxpm' 'gtk2' 'nss' 'curl' 'hicolor-icon-theme')
optdepends=('libvdpau: GPU acceleration on Nvidia card')
makedepends=('bsdiff')
provides=('flashplayer')
conflicts=('flashplugin')
license=('custom')
options=(!strip)
install=flashplugin.install
backup=(etc/adobe/mms.cfg)

source=("http://fpdownload.macromedia.com/get/flashplayer/pdc/$pkgver/install_flash_player_11_linux.x86_64.tar.gz"
        "http://www.adobe.com/products/eulas/pdfs/${_licensefile}"
        mms.cfg
        patch.bsdiff)
md5sums=('ad4df00defbb4161df3ad58f276e84a3'
         '94ca2aecb409abfe36494d1a7ec7591d'
         'f34aae6279b40e0bd2abfb0d9963d7b8'
         '31a0e345e446dc87e977a444416aa19e')

build () {
    bspatch libflashplayer.so libflashplayer.mimefix.so patch.bsdiff
}

package () {
    install -Dm755 libflashplayer.so "$pkgdir/usr/lib/mozilla/plugins/libflashplayer.so"
    install -Dm755 libflashplayer.mimefix.so "$pkgdir/usr/lib/mozilla/plugins/libflashplayer.mimefix.so"
    if [ "$CARCH" = x86_64 ]; then
        install -Dm755 usr/lib64/kde4/kcm_adobe_flash_player.so "$pkgdir/usr/lib/kde4/kcm_adobe_flash_player.so"
    else
        install -Dm755 usr/lib/kde4/kcm_adobe_flash_player.so "$pkgdir/usr/lib/kde4/kcm_adobe_flash_player.so"
    fi
    install -Dm755 usr/bin/flash-player-properties "$pkgdir/usr/bin/flash-player-properties"
    for i in 16x16 22x22 24x24 32x32 48x48; do
        install -Dm644 usr/share/icons/hicolor/$i/apps/flash-player-properties.png \
            "$pkgdir/usr/share/icons/hicolor/$i/apps/flash-player-properties.png"
    done
    install -Dm644 usr/share/applications/flash-player-properties.desktop "$pkgdir/usr/share/applications/flash-player-properties.desktop"
    install -Dm644 usr/share/kde4/services/kcm_adobe_flash_player.desktop "$pkgdir/usr/share/kde4/services/kcm_adobe_flash_player.desktop"
    install -Dm644 "${_licensefile}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
    install -Dm644 mms.cfg "$pkgdir/etc/adobe/mms.cfg"
}
