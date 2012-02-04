pkgname=ttf-maelstrom
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Maelstrom font from dafont.com"
arch=('any')
source=('http://img.dafont.com/dl/?f=maelstrom')
md5sums=('d0b15a1a42d40e0568621a0bfd05c8a4')
install=$pkgname.install
license=("custom: Free for personal use")
url=("http://www.dafont.com/maelstrom.font")

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
