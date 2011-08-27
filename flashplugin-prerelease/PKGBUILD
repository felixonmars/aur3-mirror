# Contributor : Anish Bhatt <anish[removethis][at]gatech[dot]edu>

pkgname=flashplugin-prerelease
pkgver=11.0.1.98
pkgrel=1

pkgdesc='Adobe Flash Player 11 Beta'
url='http://labs.adobe.com/technologies/flashplatformruntimes/flashplayer11/'
arch=('i686' 'x86_64')

source=('http://download.macromedia.com/pub/labs/flashplatformruntimes/flashplayer11/flashplayer11_b2_install_lin_32_080811.tar.gz'
        mms.cfg
        LICENSE)
md5sums=('285d585fd6bbf6bdaf16d404dceaa761'
         'df30781e4c9b789e2d7f6cdbd9f47d6b'
         '05ccdb2de8f04af6641675975a807cf5')

if [[ $CARCH == x86_64 ]]; then
source[0]=http://download.macromedia.com/pub/labs/flashplatformruntimes/flashplayer11/flashplayer11_b2_install_lin_64_080811.tar.gz
md5sums[0]=87ccb674fbcf94739f82cc6089634623
fi
_licensefile='LICENSE'

depends=('mozilla-common' 'libxt' 'gtk2' 'nss' 'curl')
optdepends=('libvdpau: GPU acceleration on Nvidia card')
conflicts=('flashplugin')
provides=('flashplayer' 'flashplugin')
license=('custom')
options=(!strip)
backup=(etc/adobe/mms.cfg)
install='flashplugin-prerelease.install'
package() {
  install -D -m755 ${srcdir}/usr/lib/kde4/kcm_adobe_flash_player.so ${pkgdir}/usr/lib/kde4/kcm_adobe_flash_player.so
  install -D -m644 ${srcdir}/usr/share/icons/hicolor/16x16/apps/flash-player-properties.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/flash-player-properties.png
  install -D -m644 ${srcdir}/usr/share/icons/hicolor/32x32/apps/flash-player-properties.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/flash-player-properties.png
  install -D -m644 ${srcdir}/usr/share/icons/hicolor/24x24/apps/flash-player-properties.png ${pkgdir}/usr/share/icons/hicolor/24x24/apps/flash-player-properties.png
  install -D -m644 ${srcdir}/usr/share/icons/hicolor/48x48/apps/flash-player-properties.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/flash-player-properties.png
  install -D -m644 ${srcdir}/usr/share/icons/hicolor/22x22/apps/flash-player-properties.png ${pkgdir}/usr/share/icons/hicolor/22x22/apps/flash-player-properties.png
  install -D -m644 ${srcdir}/usr/share/icons/hicolor/48x48/apps/flash-player-properties.png ${pkgdir}/usr/share/pixmaps/flash-player-properties.png
  install -D -m644 ${srcdir}/usr/share/applications/flash-player-properties.desktop ${pkgdir}/usr/share/applications/flash-player-properties.desktop
  install -D -m644 ${srcdir}/usr/share/kde4/services/kcm_adobe_flash_player.desktop ${pkgdir}/usr/share/kde4/services/kcm_adobe_flash_player.desktop
  install -D -m755 ${srcdir}/usr/bin/flash-player-properties ${pkgdir}/usr/bin/flash-player-properties
  install -D -m755 libflashplayer.so ${pkgdir}/usr/lib/mozilla/plugins/libflashplayer.so
  install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}
  install -D -m644 mms.cfg ${pkgdir}/etc/adobe/mms.cfg
}


