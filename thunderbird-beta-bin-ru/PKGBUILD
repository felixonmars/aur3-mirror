# Maintainer: Stanislav Nikitin <pztrn at pztrn dot ru>
# Based on thunderbird-beta-bin PKGBUILD

pkgname=thunderbird-beta-bin-ru
pkgver=5.0b2
pkgrel=1
pkgdesc="Standalone Mail/News reader - Bleeding edge russian binary version"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/projects/thunderbird"
depends=('gtk2' 'mozilla-common' 'libxt' 'shared-mime-info' 'alsa-lib' 'dbus-glib' 'fontconfig' 'freetype2' 'cairo' 'desktop-file-utils' 'libpng')
optdepends=('libcanberra: for sound support'
            'yasm: for WebM support')
provides=("thunderbird=${pkgver}")
conflicts=('thunderbird-beta')
install=${pkgname}.install
# In case releases.mozilla.org is not responding or the file(s) aren't yet uploaded there:
source=(ftp://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/${pkgver}/linux-${CARCH}/ru/thunderbird-${pkgver}.tar.bz2
# source=(http://releases.mozilla.org/pub/mozilla.org/thunderbird/releases/${pkgver}/linux-${CARCH}/en-US/thunderbird-${pkgver}.tar.bz2
        thunderbird-beta.desktop)
md5sums=(`wget ${source/li*}/MD5SUMS -qO - | grep ru | grep "${CARCH}" | grep bz | cut -d " " -f1`
         '13f694aab7fab4ead5c2135ad82dd4f8')

package() {
  sed -i 's|/usr/local/lib/thunderbird-|/opt/thunderbird-|' thunderbird/thunderbird
  install -dm755 "${pkgdir}"/{usr/{bin,share/applications},opt}
  cp -a thunderbird "${pkgdir}/opt/thunderbird-${pkgver}"
  ln -s /opt/thunderbird-${pkgver}/thunderbird "${pkgdir}/usr/bin/thunderbird-beta"
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
      install -D thunderbird/chrome/icons/default/default${i/x*/}.png "${pkgdir}/usr/share/icons/hicolor/${i}/apps/thunderbird-beta.png"
  done
  install -m644 thunderbird-beta.desktop "${pkgdir}/usr/share/applications"
}
