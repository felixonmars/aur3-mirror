pkgname=ttf-vavont
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Vavont is a handwritten font"
url="http://www.dafont.com/orakeldel.d2618"
arch=('any')
license=('GPLv3')
source=('vavont.ttf')
install=$pkgname.install
md5sums=('2f627779c05170d0c311659004b6cbb6')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
