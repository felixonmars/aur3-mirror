# Contributor: Jimmy Theis a.k.a jetheis <jimmy@jetheis.com>

pkgname=ttf-vtks-black
pkgver=1.0
pkgrel=2
pkgdesc="Vtks Black font from dafont.com"
arch=('any')
url="http://www.dafont.com/vtks-black.font"
license=('Free for personal use')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=($pkgname.zip::http://img.dafont.com/dl/?f=vtks_black)
md5sums=('e4dd2cb5391fbb9bf6a0a5f37bedc509')

build() {
  install -Dm 644 $srcdir/Vtks\ black.ttf $pkgdir/usr/share/fonts/TTF/Vtks\ black.ttf || return 1
}
