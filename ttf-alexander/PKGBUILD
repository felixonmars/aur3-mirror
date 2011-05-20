# Maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=ttf-alexander
pkgver=3.01
pkgrel=1
pkgdesc="Greek font based on a 1756 typeface by Alexander Wilson (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(http://users.teilar.gr/~g1951d/Alexander.zip LICENSE)
md5sums=('89437a9b8440771a0c7b725349cff466'
         'bc1709dc3b1f6a7545ab366923e01a1c')
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/OTF
  cp $srcdir/Alexander.otf $pkgdir/usr/share/fonts/OTF/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

