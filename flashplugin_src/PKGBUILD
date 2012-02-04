# Author: akulikov <http://tol-nabat.org.ua>
# Maintainer: akulikov <tuxuls at gmail dot com>

pkgname='flashplugin_src'
pkgver=11.0.1.152
pkgrel=2
group=(multimedia)
url='http://www.adobe.com/'
pkgdesc='Adobe Flash Player 11.0.1.152 (x86_64 && i686)'
md5sums=('782952c5730caa4e4cbe7e1d9dfa6214')
md5sums=('34051edfcb78e6db14567a6c5f53e161')
[ "${CARCH}" = "x86_64" ] && source=('http://fpdownload.macromedia.com/get/flashplayer/pdc/${pkgver}/install_flash_player_11_linux.x86_64.tar.gz')
[ "${CARCH}" = "x86_64" ] && md5sums=('782952c5730caa4e4cbe7e1d9dfa6214')
[ "${CARCH}" = "i686" ] && source=('http://fpdownload.macromedia.com/get/flashplayer/pdc/${pkgver}/install_flash_player_11_linux.i386.tar.gz')
[ "${CARCH}" = "i686" ] && md5sums=('34051edfcb78e6db14567a6c5f53e161')
arch=('i686' 'x86_64')
depends=('mozilla-common' 'libxt' 'gtk2' 'nss' 'curl')
optdepends=('libvdpau: GPU acceleration on Nvidia card')
conflicts=('flashplugin' 'flashplugin-prerelease' 'flashplugin-debugger' 'flashplugin-beta' 'flashplugin-prerelease-debug')
provides=('flashplayer' 'flashplugin')
license=('custom')
options=(!strip)
[ "${CARCH}" = "i686" ] && backup=(etc/adobe/mms.cfg)

if [ "${CARCH}" = "i686" ] ; then
build() {
  pushd ${srcdir}/usr/share/kde4/services
    sed 's/adobe-flash-properties/flash-player-properties/g' kcm_adobe_flash_player.desktop > kcm_adobe_flash_player.desktop.sed
    cat kcm_adobe_flash_player.desktop.sed > kcm_adobe_flash_player.desktop
  popd
}
fi

package() {
  install -D -m755 ${srcdir}/libflashplayer.so ${pkgdir}/usr/lib/mozilla/plugins/libflashplayer.so
  if [ "${CARCH}" = "i686" ] ; then
    install -D -m644 mms.cfg ${pkgdir}/etc/adobe/mms.cfg
    install -D -m755 ${srcdir}/usr/lib/kde4/kcm_adobe_flash_player.so ${pkgdir}/usr/lib/kde4/kcm_adobe_flash_player.so
    install -D -m644 ${srcdir}/usr/share/icons/hicolor/16x16/apps/flash-player-properties.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/flash-player-properties.png
    install -D -m644 ${srcdir}/usr/share/icons/hicolor/32x32/apps/flash-player-properties.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/flash-player-properties.png
    install -D -m644 ${srcdir}/usr/share/icons/hicolor/24x24/apps/flash-player-properties.png ${pkgdir}/usr/share/icons/hicolor/24x24/apps/flash-player-properties.png
    install -D -m644 ${srcdir}/usr/share/icons/hicolor/48x48/apps/flash-player-properties.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/flash-player-properties.png
    install -D -m644 ${srcdir}/usr/share/icons/hicolor/22x22/apps/flash-player-properties.png ${pkgdir}/usr/share/icons/hicolor/22x22/apps/flash-player-properties.png
    install -D -m644 ${srcdir}/usr/share/applications/flash-player-properties.desktop ${pkgdir}/usr/share/applications/flash-player-properties.desktop
    install -D -m644 ${srcdir}/usr/share/kde4/services/kcm_adobe_flash_player.desktop ${pkgdir}/usr/share/kde4/services/kcm_adobe_flash_player.desktop
    install -D -m644 ${srcdir}/usr/bin/flash-player-properties ${pkgdir}/usr/bin/flash-player-properties
  fi
}
