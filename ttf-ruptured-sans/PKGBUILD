pkgname=ttf-ruptured-sans
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Ruptured Sans font from dafont.com"
arch=('any')
source=(http://img.dafont.com/dl/?f=rupturedsans)
md5sums=('25f5f923148239de08ec4d8ada804563')
install=$pkgname.install
license=("custom: Free for personal use")
url=("http://www.dafont.com/rupturedsans.font")

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
