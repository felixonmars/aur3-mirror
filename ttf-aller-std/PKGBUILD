# Maintainer: Yegorius <yegorius@domic.us>

pkgname=ttf-aller-std
pkgver=0.9
pkgrel=1
pkgdesc="An excellent sans serif font for screen legibility"
arch=('any')
url="http://www.daltonmaag.com/"
license=(custom)
depends=('fontconfig' 'xorg-font-utils')
provides=('ttf-aller')
conflicts=('ttf-aller')
install=$pkgname.install
source=('Aller.zip::http://www.fontsquirrel.com/fonts/download/Aller')
sha256sums=('e26caafb494e6cda0018cd414337cd6e4ef43a965855f57679b308fe3cbc38ee')

package() {
  mkdir -p "$pkgdir"/usr/share/fonts/TTF
  install -m644 "$srcdir"/*.ttf "$pkgdir"/usr/share/fonts/TTF
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 "$srcdir"/*.txt "$pkgdir"/usr/share/licenses/$pkgname
}
