# Contributor: feufochmar <feufochmar@d-20.fr>
pkgname=otf-triod-postnaja
pkgver=1.0
pkgrel=1
pkgdesc="A font attempting to mimic the typefaces used to publish Old Church Slavonic service books prior to the 20th century."
arch=('any')
url="http://openfontlibrary.org/files/Daniel_J/97"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=triod-postnaja.install
source=("http://openfontlibrary.org/content/Daniel_J/97/TriodPostnaja.otf" "OFL.txt")

build() {
  cd "$srcdir"
  install -D -m644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/OTF
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
}

 
md5sums=('3f9d6ed5e2597347a3dbfcfbcd1dd9ce'
         'de4676c9bdca211c836e5a1fc2238ab7')
