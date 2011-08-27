# Contributor: Jimmy Theis a.k.a jetheis <jimmy@jetheis.com>

pkgname=ttf-jellyka-saint-andrews-queen
pkgver=1.0
pkgrel=2
pkgdesc="Jellyka, Saint-Andrew's Queen font from dafont.com"
arch=('any')
url="http://www.dafont.com/jellyka-saint-andrews-queen.font"
license=('Free for personal use')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=($pkgname.zip::http://img.dafont.com/dl/?f=jellyka_saint_andrews_queen)
md5sums=('1eb9fc08cc63e4ae1c959e666eaa0258')

build() {
  install -Dm 644 $srcdir/Saint-Andrews\ Queen.ttf $pkgdir/usr/share/fonts/TTF/Saint-Andrews\ Queen.ttf || return 1
  install -Dm 644 $srcdir/ReadMe\ -\ LisezMoi.txt $pkgdir/usr/share/doc/ttf-jellyka-saint-andrews-queen/ReadMe\ -\ LisezMoi.txt
}
