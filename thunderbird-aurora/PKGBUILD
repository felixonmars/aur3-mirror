# Maintainer: kang <kang@insecure.ws>
# Based on Det's thunderbird-nightly

pkgname=thunderbird-aurora
pkgver=14.0a2
pkgrel=1
pkgdesc="Standalone Mail/News reader - Aurora channel"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/thunderbird"
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 'freetype2' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg' 'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss' 'shared-mime-info' 'sqlite3' 'startup-notification')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=$pkgver")
install=$pkgname.install
source=(http://ftp.mozilla.org/pub/thunderbird/nightly/latest-comm-aurora/thunderbird-$pkgver.en-US.linux-$CARCH.tar.bz2
        $pkgname.desktop)
sha512sums=(`wget ${source/ta*}checksums -qO - | grep bz | grep 512 | cut -d " " -f1`
            '0d835cca27c7cc320b29005c52b3a69e4a03d755be4a8946d3c8c36c734c231b5c67acb45ad0535dc95633776691b4536776e1f9dca5507adb5a538a2a2a5234')

package() {
  mkdir -p "$pkgdir"/{usr/bin,opt}
  cp -a thunderbird "$pkgdir/opt/$pkgname"
  ln -s /opt/$pkgname/thunderbird "$pkgdir/usr/bin/$pkgname"
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
      install -Dm644 thunderbird/chrome/icons/default/default${i/x*/}.png "$pkgdir/usr/share/icons/hicolor/${i}/apps/$pkgname.png"
  done
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  rm -rf "$pkgdir/opt/$pkgname/dictionaries"
  ln -sf /usr/share/hunspell "$pkgdir/opt/$pkgname/dictionaries"
}
