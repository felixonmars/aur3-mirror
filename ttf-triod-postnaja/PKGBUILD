# Contributor: feufochmar <feufochmar@d-20.fr>
pkgname=ttf-triod-postnaja
pkgver=20110805
pkgrel=1
arch=(any)
pkgdesc="A font attempting to mimic the typefaces used to publish Old Church Slavonic service books prior to the 20th century."
url="http://openfontlibrary.org/font/triod-postnaja"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=triod-postnaja.install
source=("http://openfontlibrary.org/assets/downloads/triod-postnaja/064a178a89d1ff5a304797c08b75fa76/triod-postnaja.zip" "OFL.txt")

build() {
  cd "$srcdir"
  install -D -m644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}

 
md5sums=('064a178a89d1ff5a304797c08b75fa76'
         'de4676c9bdca211c836e5a1fc2238ab7')
