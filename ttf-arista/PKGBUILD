# Contributor: Jimmy Theis a.k.a jetheis <jimmy@jetheis.com>

pkgname=ttf-arista
pkgver=1.0
pkgrel=4
pkgdesc="Arista font from dafont.com"
arch=('any')
url="http://www.dafont.com/arista.font"
license=('Free for personal use')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=($pkgname.zip::http://img.dafont.com/dl/?f=arista)
md5sums=('367dcf6801c6de31ddb41517b87223ed')

build() {
  install -Dm 644 $srcdir/[z]\ Arista.ttf $pkgdir/usr/share/fonts/TTF/[z]\ Arista.ttf || return 1
  install -Dm 644 $srcdir/[z]\ Arista\ light.ttf $pkgdir/usr/share/fonts/TTF/[z]\ Arista\ light.ttf || return 1
  install -Dm 644 $srcdir/[z]\ Arista\ ExtraFilled.ttf $pkgdir/usr/share/fonts/TTF/[z]\ Arista\ ExtraFilled.ttf || return 1
  install -Dm 644 $srcdir/demoEula.txt $pkgdir/usr/share/licenses/ttf-arista/demoEula.txt || return 1
  install -Dm 644 $srcdir/Readme.txt $pkgdir/usr/share/doc/ttf-arista/Readme.txt || return 1
}
