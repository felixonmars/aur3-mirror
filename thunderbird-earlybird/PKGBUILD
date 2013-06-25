# Mantainer: py_crash <agustin.ferrario@hotmail.com.ar>
# Based on kang's thunderbird-aurora

pkgname=thunderbird-earlybird
pkgver=24.0a2
pkgrel=1
pkgdesc="Standalone Mail/News reader - Earlybird channel"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/thunderbird"
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 'freetype2' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg' 'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss' 'shared-mime-info' 'sqlite3' 'startup-notification')
optdepends=('libcanberra: for sound support')
makedepends=('wget')
provides=("thunderbird=$pkgver")
replaces=("thunderbird-aurora")
install=$pkgname.install
source=(http://ftp.mozilla.org/pub/thunderbird/nightly/latest-comm-aurora/thunderbird-$pkgver.en-US.linux-$CARCH.tar.bz2
        $pkgname.desktop)

if [[ "$CARCH" == "i686" ]]; then
    sha512sums=('7d0dfcfb8f33e40d1bb0dfbfbe67ca983d4bcf9cb00cf84195b63c5edf23bffce0e812a338dfd1d82e13197cdc35411c42e792810484d0b6f8fa991be6bb5433'
	                'a36bb5710b9cd6637cf6f538808e2fba8c99fdd1d486446ff9ee8094ca30b5592c17b3e808cae1da7ff2b28123f54902ed4ee1501585a8dcfc54d581588638d3')
                fi

if [[ "$CARCH" == "x86_64" ]]; then
        sha512sums=('0800009f6ae80f10bc9ca1b462533b31cd4c68e6d61fc5dfb2aafbe5bc9fe9a347dfdba26128f7062bbcecd899e5440f63db3c04da9c93e10c1e0d3d5ce2c0eb'
                        'a36bb5710b9cd6637cf6f538808e2fba8c99fdd1d486446ff9ee8094ca30b5592c17b3e808cae1da7ff2b28123f54902ed4ee1501585a8dcfc54d581588638d3')
                    fi

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
