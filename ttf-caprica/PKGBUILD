# Contributor: Jimmy Theis a.k.a jetheis <jimmy@jetheis.com>

pkgname=ttf-caprica
pkgver=1.0
pkgrel=2
pkgdesc="Caprica font from dafont.com"
arch=('any')
url="http://www.dafont.com/caprica.font"
license=('Free')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=($pkgname.zip::http://img.dafont.com/dl/?f=caprica)
md5sums=('d6734751e034647c03519184a0d350f6')

build() {
  install -Dm 644 $srcdir/Caprica.ttf $pkgdir/usr/share/fonts/TTF/Caprica.ttf || return 1
}
