pkgname=ttf-president-gas
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="custom fonts"
arch=('any')
source=(http://www.1001freefonts.com/font/PresidentGas.zip)
license=('freeware')
install=$pkgname.install
url="http://www.dafont.com/president-gas.font"
md5sums=('b9d8d2a498e62c008355590537b02793')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.TTF $pkgdir/usr/share/fonts/TTF
}
