# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: berkus <berkus@madfire.net>
# Contributor: hm_b <holger@music-nerds.net>

pkgname=renoise
pkgver=2.7.0
pkgrel=1
pkgdesc="A sophisticated music sequencer and audio processing application"
arch=('i686' 'x86_64')
url="http://www.renoise.com"
license=('custom:renoise')
depends=('alsa-lib' 'libx11' 'gcc-libs')
optdepends=('jack: For JACK audio support')
makedepends=('xdg-utils')
 [ $CARCH = "x86_64" ] && {
  if64="_64"
  md5sums=('7b70a52ceea4f3715f05004385df5ead')
 } || {
  md5sums=('457770e0492412f8f97d7d1d2fcc7485')
 }
source=("http://www.renoise.com/files/demo/Renoise_${pkgver//./_}_Demo_x86$if64.tar.bz2")
install=renoise.install

package () {
 cd "$srcdir/Renoise_${pkgver//./_}_Demo_x86$if64"

 mkdir -p "$pkgdir/usr/share/renoise-$pkgver"
 cp -rf "Resources"/* "$pkgdir/usr/share/renoise-$pkgver"

 install -Dm 755 "renoise" "$pkgdir/usr/bin/renoise"
 install -Dm 644 "Installer/renoise.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/renoise.png"
 install -Dm 644 "Installer/renoise.desktop" "$pkgdir/usr/share/applications/renoise.desktop"
 install -Dm 644 "Installer/renoise.1.gz" "$pkgdir/usr/share/man/man1/renoise.1.gz"
 install -Dm 644 "Installer/renoise-pattern-effects.5.gz" "$pkgdir/usr/share/man/man5/renoise-pattern-effects.5.gz" 
 install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
