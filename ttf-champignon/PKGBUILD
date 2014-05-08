# Maintainer: viperpaulo

pkgname=ttf-champignon
pkgver=1.0
pkgrel=1
pkgdesc="Champignon font from dafont.com"
arch=('any')
url="http://www.dafont.com/champignon.font"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=($pkgname.zip::http://img.dafont.com/dl/?f=champignon )
md5sums=('e1c130c5db203ad8cd88d87602d328e3')

build() {
  cd $srcdir
  install -Dm644 Champignon.otf $pkgdir/usr/share/fonts/TTF/Champignon.otf
  install -Dm644 champignonaltswash.ttf $pkgdir/usr/share/fonts/TTF/champignonaltswash.ttf
  install -Dm644 license.txt $pkgdir/usr/share/licenses/ttf-champignon/LICENSE
}
