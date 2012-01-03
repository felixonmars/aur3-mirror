# Maintained by ivoarch <ivayloarch@gmail.com> 
pkgname=ttf-keptsans 
pkgver=1
pkgrel=1.1
pkgdesc="KePT Sans and KePT Serif are balkan extension of PT Sans and PT Serif fonts"
arch=('any')
license=('OFL')
url="http://code.google.com/p/kept-fonts/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("http://kept-fonts.googlecode.com/files/keptsans-ttf-1.1.zip")

sha1sums=('f277bf789fdb88a0df00aa6696a06a024f2bc5e3')

build() {
  cd "$startdir/src/$pkgname"
  mkdir -p "$startdir/pkg/usr/share/fonts/TTF/"
  install -m644 *.ttf $startdir/pkg/usr/share/fonts/TTF/ || return 1
}

