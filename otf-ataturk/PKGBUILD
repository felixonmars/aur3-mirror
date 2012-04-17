# Maintainer: Fatih Bostancı <faopera@gmail.com>

pkgname=otf-ataturk
pkgver=1.0
pkgrel=1
pkgdesc="TTF M. Kemal Atatürk's handwriting font"
arch=('any')
url="http://www.artikeldeko.com.tr/atafont.asp"
license=("custom: Free for personal use")
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=${pkgname}.install

source=('http://www.artikel.com.tr/atafont/ataturk.otf')
md5sums=('1c8a25531e4f2194a82b488715032462')

build() {
  install -Dm644 ${srcdir}/ataturk.otf ${pkgdir}/usr/share/fonts/OTF/ataturk.otf
}