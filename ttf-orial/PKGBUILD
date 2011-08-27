# Contributor: Jimmy Theis a.k.a jetheis <jimmy@jetheis.com>

pkgname=ttf-orial
pkgver=1.0
pkgrel=4
pkgdesc="Orial font from dafont.com"
arch=('any')
url="http://www.dafont.com/orial.font"
license=('Free')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=($pkgname.zip::http://img.dafont.com/dl/?f=orial)
md5sums=('d05ad65649a1cedd34b123c4d6079339')

build() {
  install -Dm 644 $srcdir/Orial.ttf $pkgdir/usr/share/fonts/TTF/Orial.ttf || return 1
  install -Dm 644 $srcdir/Orial_Bold.otf $pkgdir/usr/share/fonts/OTF/Orial_Bold.otf || return 1
  install -Dm 644 $srcdir/readme\ orial.txt $pkgdir/usr/share/doc/ttf-orial/readme\ orial.txt || return 1
  install -Dm 644 $srcdir/License.rtf $pkgdir/usr/share/licenses/License.rtf || return 1
}
