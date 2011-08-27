# Maintainer: TDY <tdy@gmx.com>

pkgname=ttf-sugaku
pkgver=1.0
pkgrel=1
pkgdesc="A series of symbol fonts designed for mathematics with mathematical precision"
arch=('i686' 'x86_64')
url="http://cg.scs.carleton.ca/~luc/sugaku.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://cg.scs.carleton.ca/~luc/sugaku-ttffiles.zip license.txt)
md5sums=('31212041c0199b7248e170e518859348'
         '9c1ee07c6817392ede48d3a53122a174')

build() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
