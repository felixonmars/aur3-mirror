# Mantainer: steef435 <steef435@hotmail.com>
pkgname=otf-entypo
pkgver=2.0
pkgrel=1
pkgdesc="A font set of 250+ carefully crafted pictograms."
arch=('any')
url="http://www.entypo.com"
license=('CCPL:by-sa'
         'custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=entypo.install
source=("http://dl.dropbox.com/u/4339492/Entypo.zip"
        "license.txt"
        "OFL.txt")
md5sums=("c8d3934d41066a470c444f3236133203"
         "69e35cdba6c562199177104127137377"
         "60aa5b02420a96f0fb1e19f8690e94f3")

package() {
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname" $srcdir/license.txt $srcdir/OFL.txt
  install -dm755 "$pkgdir/usr/share/fonts/OTF"
  cd "$srcdir/Entypo/Desktop typeface/"
  install -m644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
}
