# Maintainer: Paolo Stivanin <http://www.polslinux.it>

pkgname=thunderbird-beta-bin-it
_pkgreal=thunderbird-beta-bin
pkgver=14.0b3
pkgrel=1
pkgdesc="Standalone Mail/News reader - Ultima beta disponibile in lingua italiana (file binari)."
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/thunderbird"
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 'freetype2' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg' 'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss' 'shared-mime-info' 'sqlite3' 'startup-notification')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=$pkgver")
conflicts=('thunderbird-beta')
_srcurl=("ftp://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases")
install=${_pkgreal}.install
source=(${_srcurl}/$pkgver/linux-${CARCH}/it/thunderbird-$pkgver.tar.bz2
        ${_pkgreal}.desktop)
md5sums=("$(curl -s ${_srcurl}/${pkgver}/MD5SUMS | grep linux-${CARCH}/it | grep thunderbird-${pkgver}.tar.bz2 | sed '2d' | cut -f1 -d' ')"
         'f8a9b91202e8c85ad7b8f23fb82a4d7b')

package() {
  install -d "$pkgdir"/{usr/bin,opt}
  cp -a thunderbird "${pkgdir}/opt/${_pkgreal}"
  ln -s /opt/${_pkgreal}/thunderbird "${pkgdir}/usr/bin/thunderbird-beta"
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
      install -Dm644 thunderbird/chrome/icons/default/default${i/x*/}.png "${pkgdir}/usr/share/icons/hicolor/$i/apps/thunderbird-beta.png"
  done
  install -Dm644 ${_pkgreal}.desktop "${pkgdir}/usr/share/applications/${_pkgreal}.desktop"
  rm -rf "${pkgdir}/opt/${_pkgreal}/dictionaries"
  ln -sf /usr/share/hunspell "$pkgdir/opt/${_pkgreal}/dictionaries"
}
