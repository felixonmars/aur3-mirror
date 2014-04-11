# Contributor: feufochmar <feufochmar@d-20.fr>
pkgname=otf-pecita-v3
pkgver=3.5
pkgrel=2
pkgdesc="A handwritten font with attached letters. V3.x version."
arch=('any')
url="http://pecita.eu"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=pecita.install
source=("http://pecita.eu/f/v3/Pecita.otf" "OFL.txt")

package() {
  cd "$srcdir"
  install -D -m644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/OTF
  install -m644 Pecita.otf "$pkgdir"/usr/share/fonts/OTF/Pecita-v3.otf
}

md5sums=('6bff5d08030572adaa3e0dcded1fa493'
         '3fa78374b78960f75ba6b4440309ac91')
