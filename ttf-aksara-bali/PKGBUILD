# Contributor: David Mikalova <dmikalova@gmail.com>

pkgname=ttf-aksara-bali
pkgver=1
pkgrel=1
pkgdesc="Aksara Bali font that provides Balinese."
url="http://www.alanwood.net/unicode/fonts-southeast-asian.html#balinese"
license=('unknown')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://www.alanwood.net/downloads/aksrbali.zip")
md5sums=('a2124927b9ed956e7df55c14ccd1d692')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp "$srcdir/aksrbali/AksaraBali.ttf" "$pkgdir/usr/share/fonts/TTF/"
}