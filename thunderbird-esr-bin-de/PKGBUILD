# Maintainer: ferda

pkgname=thunderbird-esr-bin-de
_pkgreal=thunderbird-esr-bin
pkgver=10.0
pkgrel=1
pkgdesc="Standalone Mail/News reader – Extended Support Release – German"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/thunderbird"
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 'freetype2' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg' 'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss' 'shared-mime-info' 'sqlite3' 'startup-notification')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=$pkgver")
install=$_pkgreal.install
source=("ftp://ftp.mozilla.org/pub/thunderbird/releases/${pkgver}esr/linux-${CARCH}/de/thunderbird-${pkgver}esr.tar.bz2"
        "$_pkgreal.desktop" "$_pkgreal.install")

md5sums=('445d1c677a9c21626b9c801decab2e2e'
         'c4162b713e9d063202a079d2243fdc93'
         '27b0c8837cdf09244b47e773e0d578ce')
[[ "$CARCH" == "i686" ]] && md5sums[0]="d1f9c5d5fec0bcb8ea3cc8f66d0e1aae"

package() {
  install -d "$pkgdir"/{usr/bin,opt}
  cp -a thunderbird "$pkgdir/opt/$_pkgreal"
  ln -s /opt/$_pkgreal/thunderbird "$pkgdir/usr/bin/thunderbird-esr"
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
      install -Dm644 thunderbird/chrome/icons/default/default${i/x*/}.png "$pkgdir/usr/share/icons/hicolor/$i/apps/thunderbird-esr.png"
  done
  install -Dm644 $_pkgreal.desktop "$pkgdir/usr/share/applications/$_pkgreal.desktop"
  rm -rf "$pkgdir/opt/$_pkgreal/dictionaries"
  ln -sf /usr/share/hunspell "$pkgdir/opt/$_pkgreal/dictionaries"
}
