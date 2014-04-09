# Contributor: David Mikalova <dmikalova@gmail.com>

pkgname=ttf-tuladha-jejeg
pkgver=2.01
pkgrel=2
pkgdesc="Tuladha Jejug is a Unicode 5.2 font for Javanese script."
url="https://sites.google.com/site/jawaunicode/download"
license=('SIL OFL')
arch=('any')
depends=('fontconfig' 'xorg-font-util')
install=$pkgname.install
source=("https://sites.google.com/site/jawaunicode/TuladhaJejegGr_2.01.zip")
md5sums=('75d31da7f268ca472cf983a7f792f775')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp "$srcdir/TuladhaJejeg_gr.ttf" "$pkgdir/usr/share/fonts/TTF/Tuladha-Jejeg.ttf"
}