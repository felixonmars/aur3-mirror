# Maintainer: BrainwreckedTech
# Contributors: Ner0 sl1pkn07 ava1ar

pkgname=chromium-pepper-flash-stable
pkgver=14.0.0.177
pkgrel=1
pkgdesc="Google Chrome's Pepper Flash plugin for Chromium (stable, non-split version)"
arch=('i686' 'x86_64')
url="http://www.google.com/chrome"
license=('custom:chrome')
optdepends=('pulseaudio-alsa: For PulseAudio users')
conflicts=('chromium-pepper-flash' 'chromium-pepper-flash-dev')
provides=('chromium-pepper-flash')
options=('!emptydirs' '!strip')
install=pepper.install

if [ "$CARCH" = 'i686' ]; then
  sha256sums=('132d6272b3c5ecbdc5f29f42b7ab2e8e7081cd232d2ec33c02dc56f21dbc5f6f') && _arch='i386'
elif [ "$CARCH" = 'x86_64' ]; then
  sha256sums=('5ceb34e2f2c8f47da6b7b37e7bf4fdecfdebc02bd3191f0f69898705f6598e40') && _arch='amd64'
fi

source=("https://dl.google.com/linux/direct/google-chrome-stable_current_${_arch}.deb"
	'LICENSE.txt')

sha256sums+=('3ab9765543eb1d9eff57c584b869d5aeb9fac253392cc411feaa2f3d877967d2')

package() {
  bsdtar -C "$pkgdir/" -xf data.tar.lzma opt/google/chrome/PepperFlash
  install -dm755 "$pkgdir/usr/lib/"
  mv "$pkgdir/opt/google/chrome/PepperFlash" "$pkgdir/usr/lib/"
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  sed -i "s/flashver=.*/flashver=$pkgver/" "$startdir/pepper.install"
}
