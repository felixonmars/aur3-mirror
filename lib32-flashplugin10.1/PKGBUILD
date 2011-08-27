# Maintainer: Robert McCathie <archaur at rmcc dot com dot au>

_name=flashplugin
pkgname=lib32-${_name}10.1
_licensefile='Reader_Player_AIR_WWEULA-Combined-20080204_1313.pdf'
pkgver=10.1.102.65
pkgrel=1
pkgdesc="Adobe Flash Player 10.1 series. Multilib for x86_64"
url="http://get.adobe.com/flashplayer"
arch=('x86_64')
depends=('mozilla-common' 'lib32-libxt' 'lib32-gtk2' 'lib32-nss' 'lib32-curl' 'lib32-alsa-lib' 'nspluginwrapper')
provides=('flashplayer' 'flashplugin')
conflicts=('flashplugin')
license=('custom')
install=flashplugin.install
source=("http://www.paradoxcomputers.com.au/flashplugin10.1-linux/install_flash_player_10_linux.tar.gz"
        "http://www.adobe.com/products/eulas/pdfs/${_licensefile}")
md5sums=('f628237fc297db061a582c42b639871a'
         '1636037610ee2aa35c5fb736a697b7e0')
options=(!strip)

package() {
  install -d -m755 "${pkgdir}/usr/lib32/mozilla/plugins/"
  install -m755 "${srcdir}/libflashplayer.so" "${pkgdir}/usr/lib32/mozilla/plugins/"
  install -d -m755 "${pkgdir}/usr/share/licenses/${_name}/"
  install -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${_name}/LICENSE.pdf"

  # Install npwrapper:
  mkdir -p "${pkgdir}/usr/lib/mozilla/plugins/"
  touch "${pkgdir}/usr/lib/mozilla/plugins/npwrapper.libflashplayer.so"
  chmod 755 "${pkgdir}/usr/lib/mozilla/plugins/npwrapper.libflashplayer.so"
}
