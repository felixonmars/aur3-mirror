# Mantainer: py_crash <agustin.ferrario@hotmail.com.ar>
# Based on kang's thunderbird-aurora

pkgname=thunderbird-earlybird
pkgver=24.0a2
pkgrel=2
pkgdesc="Standalone Mail/News reader - Earlybird channel"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/thunderbird"
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 'freetype2' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg' 'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss' 'shared-mime-info' 'sqlite3' 'startup-notification')
optdepends=('libcanberra: for sound support')
makedepends=('wget')
replaces=("thunderbird-aurora")
install=$pkgname.install
source=($pkgname.desktop
        http://ftp.mozilla.org/pub/thunderbird/nightly/latest-comm-aurora/thunderbird-$pkgver.en-US.linux-$CARCH.tar.bz2)
sha512sums=('a36bb5710b9cd6637cf6f538808e2fba8c99fdd1d486446ff9ee8094ca30b5592c17b3e808cae1da7ff2b28123f54902ed4ee1501585a8dcfc54d581588638d3')


[[ "$CARCH" == "i686" ]]  && sha512sums+=('f0136e3008879debe3c653e902b0ed736ede62758bd494867c01c3d08d15a0fd0af47e181d282271164c14e0405068c14972d4b673dcdefb8b52d2b20014d4e2')

[[ "$CARCH" == "x86_64" ]]  && sha512sums+=('691413592741dc4d6b1f7c254c650e205ef4fc12b558aff1293ae4a2efe1f2f24a7266e446e54d0b05667b2479cc7a2a7c261c60b319bca1521ff1953614d935')

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
