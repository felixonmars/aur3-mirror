# Contributor: Jimmy Theis a.k.a jetheis <jimmy@jetheis.com>

pkgname=ttf-boris-black-bloxx
pkgver=1.0
pkgrel=3
pkgdesc="Boris Black Bloxx font from dafont.com"
arch=('any')
url="http://www.dafont.com/boris-black-bloxx.font"
license=('Free')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=($pkgname.zip::http://img.dafont.com/dl/?f=boris_black_bloxx)
md5sums=('10e08059330dd4eff6093002133f9769')

build() {
  install -Dm 644 $srcdir/BorisBlackBloxx.ttf $pkgdir/usr/share/fonts/TTF/BorisBlackBloxx.ttf || return 1
  install -Dm 644 $srcdir/BorisBlackBloxxDirty.ttf $pkgdir/usr/share/fonts/TTF/BorisBlackBloxxDirty.ttf || return 1
}
